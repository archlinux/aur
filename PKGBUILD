# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=opencorsairlink-testing
pkgver=0+208+ge8d79e6
_commit=e8d79e6d7d1173d7f59776660f9817c97c5ae96b
pkgrel=1
pkgdesc='Status and control utility for Corsair Link products (testing branch)'
arch=(i686 x86_64)
url=https://github.com/audiohacked/OpenCorsairLink
license=(GPL2)
depends=(libusb)
makedepends=(git libdrm pkg-config)
provides=(opencorsairlink)
conflicts=(opencorsairlink)
source=(git+$url#commit=$_commit)
sha512sums=('SKIP')

pkgver() {
  cd OpenCorsairLink
  printf 0+%s+%s $(git rev-list --count HEAD) g$(git rev-parse --short HEAD)
}

build() {
  cd OpenCorsairLink
  LDFLAGS="$LDFLAGS -lm" make
}

package() {
  cd OpenCorsairLink
  install -D OpenCorsairLink.elf "$pkgdir"/usr/bin/opencorsairlink
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/opencorsairlink
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/opencorsairlink
}
