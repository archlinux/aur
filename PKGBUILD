# Maintainer: Angelo Theodorou <encelo@gmail.com>

pkgname=rgfw
pkgver=1.8.1
pkgrel=1
pkgdesc="A cross platform lightweight single-header simple-to-use window abstraction library"
arch=('i686' 'x86_64')
url="https://github.com/ColleagueRiley/RGFW"
license=('Zlib')
depends=('libx11' 'libxrandr' 'libxkbcommon' 'libegl' 'wayland')
makedepends=('wayland-protocols')
options=('staticlibs')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
  "add-compile-flags.patch")
sha256sums=(
  '39f9dc8f89e86926fe2be4ffd6cdc877c1e7d179e24e3c803389ece50d6aef60'
  '5f9dc9a075ebdabc362673a07fefbcc0251393d5304556ce6e24b416f1292c19')

build() {
  cd "RGFW-$pkgver"

  patch -p1 -i "$srcdir/add-compile-flags.patch"
  make libRGFW.a WAYLAND_X11=1
  make libRGFW.so WAYLAND_X11=1
}

package() {
  cd "RGFW-$pkgver"

  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 RGFW.h $pkgdir/usr/include/RGFW.h
  install -Dm644 XDL.h $pkgdir/usr/include/XDL.h

  install -Dm644 libRGFW.a $pkgdir/usr/lib/libRGFW.a
  install -Dm755 libRGFW.so $pkgdir/usr/lib/libRGFW.so
}
