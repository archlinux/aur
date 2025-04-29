# Maintainer: Luca Weiss <aur (at) lucaweiss (dot) eu>

_pkgname=libopenrazer
pkgname=libopenrazer-git
pkgver=0.4.0.r0.g6671cf6
pkgrel=1
pkgdesc="Qt wrapper around the D-Bus API from OpenRazer"
arch=('x86_64')
url="https://github.com/z3ntu/libopenrazer"
license=('GPL-3.0-or-later')
depends=('qt6-base')
makedepends=('git' 'meson' 'qt6-tools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/z3ntu/libopenrazer.git')
sha512sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "$_pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
