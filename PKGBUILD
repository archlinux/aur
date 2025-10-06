pkgname=python-pkgbuild-parser
pkgver=0.1.1
pkgrel=1
pkgdesc="Simple Python module to extract basic information directly from PKGBUILD files (not .SRCINFO)"
arch=('any')
url="https://github.com/KevinCrrl/pkgbuild-parser"
license=('MIT')
source=("https://github.com/KevinCrrl/pkgbuild_parser/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("8baf7bbe911ad5a53e9edba87b4be4320f2f2f2c5c7d094c36695855307d2152")
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
    cd "${srcdir}/pkgbuild_parser-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/pkgbuild_parser-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}