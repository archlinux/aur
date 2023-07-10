# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Brendan Van Hook <brendan (at) vastactive (dot) com>

_pkgname=metakernel
pkgname=jupyter-$_pkgname
pkgver=0.29.5
pkgrel=1
pkgdesc="A Jupyter/IPython kernel template."
arch=('any')
url="https://github.com/Calysto/metakernel"
license=('BSD')
depends=(
    'python-ipykernel'
    'python-jedi'
    'python-jupyter_core'
    'python-pexpect'
)
makedepends=('python-build' 'python-hatchling' 'python-installer')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Calysto/metakernel/archive/v${pkgver}.tar.gz")
b2sums=('797d7198c27abb65c37e2b3bc228bcee757257e88c54341e93fc6e11b6b8b86b53ef2ea55902254d7658f26c5e717d5f29628813b51caf3f07e7dc7302129f0c')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
