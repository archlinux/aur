# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_pkgname=libopenrazer
pkgname=libopenrazer-git
pkgver=r115.3c5c75e
pkgrel=1
pkgdesc="Qt wrapper around the D-Bus API from OpenRazer"
arch=('x86_64')
url="https://github.com/z3ntu/libopenrazer"
license=('GPL3')
depends=('qt5-base')
makedepends=('git' 'meson' 'qt5-tools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/z3ntu/libopenrazer.git')
sha512sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson "$_pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
