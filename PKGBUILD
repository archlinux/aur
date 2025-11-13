# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

pkgname=dymo-bluetooth
pkgver=0.1.2
pkgrel=1
pkgdesc="Use DYMO LetraTag LT-200B thermal label printer over Bluetooth in Python, without depending on its app"
arch=('any')
url="https://github.com/ysfchn/dymo-bluetooth"
license=('MIT')
depends=(
    "python-barcode"
    "python-bleak"
    "python-pillow"
    "python>=3.9"
)
makedepends=(
  "python-build"
  "python-installer"
  "python-wheel"
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ysfchn/dymo-bluetooth/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('cfc10aec1169f4736b6ac444966c367fc4d2173e0c49e758c3bf8f937ea47f62e2cae09c38194063e831f61c95c3f2127ed947da18579dcf0fcaba185dbe53ec')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 assets/example_image.png -t "$pkgdir/usr/share/doc/$pkgname/examples/"
}
