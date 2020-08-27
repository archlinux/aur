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
makedepends=("git" "meson" "ninja" "gcc")
checkdepends=()
optdepends=()
provides=("wlr-randr")
source=("git+https://github.com/emersion/wlr-randr.git#tag=v$pkgver")
md5sums=('SKIP')

prepare() {
  cd "$pkgname"
  meson --prefix /usr "$srcdir/build"
}

build() {
  cd "$srcdir/$pkgname"

  ninja -C "$srcdir/build"
}

package() {
  cd "$srcdir/$pkgname"

  DESTDIR="$pkgdir" ninja -C "$srcdir/build" install
}

# vim:set ts=2 sw=2 et:
