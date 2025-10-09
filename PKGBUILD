pkgname=python-pkgbuild-parser
pkgver=0.3.0
pkgrel=1
pkgdesc="Simple Python module to extract basic information directly from PKGBUILD files (not .SRCINFO)"
arch=('any')
url="https://github.com/KevinCrrl/pkgbuild-parser"
license=('MIT')
source=("https://github.com/KevinCrrl/pkgbuild_parser/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("93f33c4baea1894dfcb18dc63395e41d1643e0af2e34a800c6bcc4a466c8dbc4")
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