# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=neatvnc
pkgver=0+r134+g08587ba
_commit=08587baf4d5e5a1286e024719717c7b706010d0e
pkgrel=1
pkgdesc='Fast and neat VNC server library'
arch=(x86_64)
url=https://github.com/any1/neatvnc
license=(custom:ISC)
depends=(libuv pixman libjpeg-turbo)
makedepends=(git meson ninja libdrm)
source=(git+$url#commit=$_commit)
sha512sums=('SKIP')

pkgver() {
  cd $pkgname
  echo 0+r$(git rev-list --count HEAD)+g$(git rev-parse --short HEAD)
}

build() {
  mkdir -p build
  arch-meson build $pkgname \
    -D tight-encoding=enabled
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm 644 $pkgname/COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
}
