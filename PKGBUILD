pkgname=python-pkgbuild-parser
pkgver=0.1.0
pkgrel=1
pkgdesc="Simple Python module to extract basic information directly from PKGBUILD files (not .SRCINFO)"
arch=('any')
url="https://github.com/KevinCrrl/pkgbuild-parser"
license=('MIT')
source=("https://github.com/KevinCrrl/pkgbuild_parser/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("ae16a423a728892892eefcb0924a714a968aaf1b1909d37061cd7b83a20d2ccc")
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