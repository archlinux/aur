pkgname=python-pkgbuild-parser
pkgver=1.0.1
pkgrel=1
pkgdesc="Simple Python module to extract basic information directly from PKGBUILD files (not .SRCINFO)"
arch=('any')
url="https://codeberg.org/KevinCrrl/pkgbuild_parser"
license=('MIT')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=("f011d9911d93eab2f7cced813b1d8825e9eea258489dbea68b0b89a913caa99c2b94a2a6d8cf54a571457a32c20bef28d11e8977e8b5dbeecac026f36e1f83e4")
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
