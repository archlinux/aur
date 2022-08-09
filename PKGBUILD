# Maintainer: Roland Nagy <roliboy@protonmail.com>

pkgname=python-pywhat
pkgver=5.1.0
_pyproject_version=5.0.0
pkgrel=2
pkgdesc="Identify emails, IP addresses and more"
arch=("any")
url="https://github.com/bee-san/pyWhat"
license=("MIT")
depends=(
    "python"
    "python-click"
    "python-rich"
)
makedepends=(
    "python-setuptools"
    "python-poetry"
)
optdepends=(
    "python-orjson: faster JSON serialization and deserialization"
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("1e8d8052e007c30165b9cb51466dcdc1cfdea555aab0986bf7f11731095f1400")

build() {
    cd "$srcdir/pyWhat-$pkgver"
    poetry build

    cd dist
    tar xf "pywhat-$_pyproject_version.tar.gz"
    cd "pywhat-$_pyproject_version"
    python setup.py build
}

package() {
    cd "$srcdir/pyWhat-$pkgver/dist/pywhat-$_pyproject_version"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 "$srcdir/pyWhat-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
