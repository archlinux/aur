# -*- mode: pkgbuild; -*-
# Maintainer: Christopher Snowhill <chris@kode54.net>
# Contributor: Denis Zheleztsov <difrex.punk@gmail.com>
pkgname=wlr-randr
pkgver=0.1.0
pkgrel=1
pkgdesc="Utility to manage outputs of a Wayland compositor. You need a support wlr-output-management-unstable-v1 in the compositor."
arch=('x86_64')
url="https://github.com/emersion/wlr-randr"
license=('MIT')
depends=("wayland")
makedepends=("meson" "ninja" "gcc")
checkdepends=()
optdepends=()
provides=("wlr-randr")
source=("https://github.com/emersion/wlr-randr/releases/download/v$pkgver/wlr-randr-$pkgver.tar.gz"{,.sig})
sha256sums=('dbf2f02aa4d4f48dc9cef1edd1137a8ee68daa85f3c824a28c92376fd1591844' 'SKIP')
validpgpkeys=('34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48')

prepare() {
  cd "$pkgname-$pkgver"
  meson --prefix /usr "$srcdir/build"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ninja -C "$srcdir/build"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  DESTDIR="$pkgdir" ninja -C "$srcdir/build" install
}

# vim:set ts=2 sw=2 et:
