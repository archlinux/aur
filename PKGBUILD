# Maintainer: Andri Yngvason <andri@yngvason.is>

pkgname=wayvnc
pkgver=0.1.2
pkgrel=1
pkgdesc='VNC server for wlroots-based Wayland compositors'
arch=(x86_64)
url=https://github.com/any1/wayvnc
license=(custom:ISC)
depends=(libglvnd libxkbcommon libuv pixman neatvnc)
makedepends=(meson ninja)
source=("$pkgname-v$pkgver.tar.gz::https://github.com/any1/wayvnc/archive/v$pkgver.tar.gz")
sha512sums=('3ca395e1d6e3329cab51b6aaee53bc080a66b19b9c9a48d12a8226cc7024619acc85665aac4f5001d5c06dceffde9bc825b2ffa59ab0ed09e4340ef85a203a05')

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
