pkgname=python-pkgbuild-parser
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple Python module to extract basic information directly from PKGBUILD files (not .SRCINFO)"
arch=('any')
url="https://codeberg.org/KevinCrrl/pkgbuild_parser"
license=('MIT')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=("ad5954863e7dde57dd6fa1b4fd8e4cf73d530beb395ef612219ddcfd3525c03d57215388cd1ff19a7e6cb323f507c004f4c013acb61e06a286e301a4d73816ce")
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
