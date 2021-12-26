pkgname=google-raiden-mod-git
pkgver=r21667.6989ff9053e
pkgrel=1
pkgdesc='Kernel module for Google ChromeOS Suzy-Q programmator'
arch=(i686 x86_64)
url='https://chromium.googlesource.com/chromiumos/platform/ec/'
license=(BSD)
makedepends=(git)
install=raiden.install
source=(git+https://chromium.googlesource.com/chromiumos/platform/ec)
md5sums=('SKIP')

pkgver() {
  cd ec
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ec/extra/usb_serial
  make
}

package() {
  cd ec/extra/usb_serial
  install -Dm644 51-google-serial.rules "$pkgdir/usr/lib/udev/rules.d/51-google-serial.rules"
  install -Dm644 raiden.ko "$pkgdir/usr/lib/modules/$(uname -r)/kernel/drivers/google/raiden.ko"
}
