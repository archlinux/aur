# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=opencorsairlink-testing
pkgver=0+207+g6560584
_commit=656058442cba29e59043f411c290c5bf3a198713
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
sha512sums=(SKIP)

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
