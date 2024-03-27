# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Brendan Van Hook <brendan (at) vastactive (dot) com>
_pkgname=metakernel
pkgname=jupyter-$_pkgname
pkgver=0.30.2
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
b2sums=('0826f6bc8244350e94be9a04f5fa5f944f2251ec5c469d02517623902e783be2ede1e32c00e6f8b175a1fc6a6646024cf3d399cd27814f3a9b0a8f00aa4fc01d')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
