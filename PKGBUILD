# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Brendan Van Hook <brendan (at) vastactive (dot) com>
_pkgname=metakernel
pkgname=jupyter-$_pkgname
pkgver=0.30.0
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
    'python-pydot'
)
makedepends=('python-build' 'python-hatchling' 'python-installer')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Calysto/metakernel/archive/v${pkgver}.tar.gz")
b2sums=('3d4857f5266d0fe8c6125876cb588ed68f4c3c528a531b3cb590f49f4bc918cc8c45fc2dd5dca41e4f89b1031345b707cc2c84dab0a27e6eaf6a8f5b36c3958f')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
