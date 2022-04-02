# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Brendan Van Hook <brendan (at) vastactive (dot) com>

_pkgname=metakernel
pkgname=jupyter-$_pkgname
pkgver=0.29.0
pkgrel=2
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
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://github.com/Calysto/metakernel/archive/v${pkgver}.tar.gz")
sha256sums=('30cf24c742dc20b759c309a709d4d3188732166a34a26defba37f9d3dfab7413')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
