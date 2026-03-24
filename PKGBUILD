# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

pkgname=dymo-bluetooth
pkgver=0.1.3
pkgrel=1
pkgdesc="Use DYMO LetraTag LT-200B thermal label printer over Bluetooth in Python, without depending on its app"
arch=('any')
url="https://github.com/ysfchn/dymo-bluetooth"
license=('MIT')
depends=(
    'python-barcode'
    'python-bleak'
    'python-pillow'
    'python-typing_extensions'
    'python>=3.9'
)
makedepends=(
  'python-build'
  'python-installer'
  "python-wheel"
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ysfchn/dymo-bluetooth/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('ed69f534ce58247a610a3964768decbb4fef875dd68bc7b67bf859912e682c96df21ea71d8e30325f8726c378bb36b1df1b6b75673f08e58a91a75ceb065b7e3')

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
