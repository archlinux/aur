# Maintainer: Andri Yngvason <andri@yngvason.is>

pkgname=wayvnc
pkgver=0.1.1
pkgrel=1
pkgdesc='VNC server for wlroots-based Wayland compositors'
arch=(x86_64)
url=https://github.com/any1/wayvnc
license=(custom:ISC)
depends=(libglvnd libxkbcommon libuv pixman neatvnc)
makedepends=(meson ninja)
source=("$pkgname-v$pkgver.tar.gz::https://github.com/any1/wayvnc/archive/v$pkgver.tar.gz")
sha512sums=('3bcb64acd3214b708f47fdd29f785e61d64ed0502eed5d367eee898a8c14d26a8d323e75d3b6f3e1e06f9c54cd38de1b647c04e16ee26db2da12b63d55acc662')

build() {
  cd $pkgname-$pkgver
  arch-meson build
  ninja -C build
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm 644 COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
}
