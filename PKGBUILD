# Maintainer: Andrew Grigorev <andrew@ei-grad.ru>

pkgname=usb-hid-brightness
pkgver=0.2.0
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
sha256sums=('9fdf730ceff48fd8fbcc906818df3a95f89684afd5ad18ec7791db86f8df6ab8'
            'd29eacf98e2d4da969aa8c32a7bb80d676280a6869400e19823d77243e4176bb')

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
