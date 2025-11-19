pkgname=python-pkgbuild-parser
pkgver=0.4.1
pkgrel=1
pkgdesc="Simple Python module to extract basic information directly from PKGBUILD files (not .SRCINFO)"
arch=('any')
url="https://codeberg.org/KevinCrrl/pkgbuild_parser"
license=('MIT')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=("8ec1bd3ee858424a005dce103d6a0553867f69c5c1233ff01cdefc9580e51262")
conflicts=()
depends=(
    'python'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)

build() {
    cd "${srcdir}/pkgbuild_parser"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/pkgbuild_parser"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
