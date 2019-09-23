# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=opencorsairlink-testing
pkgver=0+r219+g99e1d72
_commit=99e1d72fa5a0f6230f9b8805de663319f3e8f4fd
pkgrel=1
pkgdesc='Status and control utility for Corsair Link products (testing branch)'
arch=(i686 x86_64)
url=https://github.com/audiohacked/OpenCorsairLink
license=(GPL2)
depends=(libusb)
makedepends=(git)
provides=(opencorsairlink)
conflicts=(opencorsairlink)
source=(git+$url#commit=$_commit)
sha512sums=('SKIP')

pkgver() {
  cd OpenCorsairLink
  echo 0+r$(git rev-list --count HEAD)+g$(git rev-parse --short HEAD)
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
