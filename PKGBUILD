# -*- mode: pkgbuild; -*-
# Maintainer: Denis Zheleztsov <difrex.punk@gmail.com>
pkgname=wlr-randr-git
_pkgname=wlr-randr
pkgver=r13.c4066aa
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
source=("${pkgname%-*}::git+https://github.com/emersion/wlr-randr.git")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  meson --prefix /usr "$srcdir/build"
}

build() {
  cd "$srcdir/$_pkgname"

  ninja -C "$srcdir/build"
}

package() {
  cd "$srcdir/$_pkgname"

  DESTDIR="$pkgdir" ninja -C "$srcdir/build" install
}

# vim:set ts=2 sw=2 et:
