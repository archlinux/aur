# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=opencorsairlink
pkgver=0+179+gf92ba8c
_commit=f92ba8cae34cd5fc396e987cb7326ad65f7acaf3
pkgrel=1
pkgdesc='Status and control utility for Corsair Link products'
arch=(i686 x86_64)
url=https://github.com/audiohacked/OpenCorsairLink
license=(GPL2)
depends=(libusb)
makedepends=(git libdrm pkg-config)
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
