# Maintainer: Khorne <khorne@khorne.me>
pkgname=python-pinecil
_name=${pkgname##python-}_lib
pkgver=0.2.15
pkgrel=2
pkgdesc="A python interface for Pinecil V2 controls and settings."
arch=('any')
url="https://github.com/builder555/pinecil_lib"
license=('MIT')
depends=('python' 'python-bleak')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry')
source=("${_name}-${pkgver}.tar.gz::https://github.com/builder555/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('29e3506e7eef481660edacc8e437189b1fe9885318cb82636b0ca084b3fe46ce')

prepare() {
    sed -i 's/<3.13/<=3.14/' "${_name}-${pkgver}"/pyproject.toml
}

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
