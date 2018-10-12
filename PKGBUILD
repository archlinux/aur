# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=opencorsairlink
pkgver=0+179+f92ba8c
_commit=f92ba8cae34cd5fc396e987cb7326ad65f7acaf3
pkgrel=1
pkgdesc="Utility for controlling the Corsair H100i and variants"
arch=(i686 x86_64)
url=https://github.com/audiohacked/OpenCorsairLink
license=(GPL2)
depends=(libusb)
makedepends=(git libdrm pkg-config)
conflicts=(opencorsairlink-git opencorsairlink-testing-git)
source=(git+$url#commit=$_commit)
sha512sums=(SKIP)

pkgver() {
  cd OpenCorsairLink
  printf 0+%s+%s $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd OpenCorsairLink
  LDFLAGS="$LDFLAGS -lm" make
}

package() {
  cd OpenCorsairLink
  install -D OpenCorsairLink.elf "$pkgdir"/usr/bin/opencorsairlink
  install -Dm 644 -t "$pkgdir"/usr/share/doc/opencorsairlink README.md
  install -Dm 644 -t "$pkgdir"/usr/share/licenses/opencorsairlink LICENSE
}
