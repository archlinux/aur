# Maintainer: Roland Nagy <roliboy@protonmail.com>

pkgname=python-pywhat
pkgver=5.1.0
pkgrel=4
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
    "python-poetry"
    "python-installer"
)
optdepends=(
    "python-orjson: faster JSON serialization and deserialization"
)
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/pywhat/pywhat-5.1.0.tar.gz")
sha256sums=("8a6f2b3060f5ce9808802b9ca3eaf91e19c932e4eaa03a4c2e5255d0baad85c4")

build() {
    cd "$srcdir/pywhat-$pkgver"
    poetry build
}

package() {
    cd "$srcdir/pywhat-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$srcdir/pywhat-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
