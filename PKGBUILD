pkgname=python-pkgbuild-parser
pkgver=0.2.0
pkgrel=1
pkgdesc="Simple Python module to extract basic information directly from PKGBUILD files (not .SRCINFO)"
arch=('any')
url="https://github.com/KevinCrrl/pkgbuild-parser"
license=('MIT')
source=("https://github.com/KevinCrrl/pkgbuild_parser/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("b9069da368c2ede5fb2a6ec47eba30b32ff8865cd9ba78274c2b9780efb0106d")
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