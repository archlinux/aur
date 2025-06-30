# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

pkgname=dymo-bluetooth
pkgver=0.1.1
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
b2sums=('25e897101835c01e43cb54b250b40c81a78dc819db402e905e2719012d4b51df71c95ee4331af01ee82aaa0edc81e5670fdb84998f4a2c6ba9f6b2577099ad21')

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
