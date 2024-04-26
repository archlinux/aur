# Maintainer: Andrew Grigorev <andrew@ei-grad.ru>

pkgname=usb-hid-brightness
pkgver=0.1.0
pkgrel=1
pkgdesc="Utility to control brightness for USB and Thunderbolt monitors with HID brightness interface (e.g. LG UltraFine 5K)"
arch=('x86_64')
url="https://github.com/ei-grad/usb-hid-brightness"
license=('MIT')
depends=('libusb')
makedepends=('cmake' 'make' 'gcc')
source=(
    "$url/archive/v$pkgver.tar.gz"
    "90-usb-hid-brightness.rules"
)
sha256sums=('14329cd05699f02692b5c3b46cf3514b57a823855d055e465ff9136dac46c765'
            'ac514c6b21ada5ef3c15ccdab1a4516c791c4f473d46dd764456506b149c8583')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -B build -DCMAKE_BUILD_TYPE=Release
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake --build build
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  cmake --install . --prefix "$pkgdir/usr"

  # Install udev rules
  install -Dm644 "$srcdir/90-usb-hid-brightness.rules" "$pkgdir/usr/lib/udev/rules.d/90-usb-hid-brightness.rules"
}
