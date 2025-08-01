# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=netpeek-git
pkgver=0.2.r0.g5b1b085
pkgrel=1
pkgdesc="Mordern network scanner for GNOME"
arch=(x86_64)
url="https://github.com/ZingyTomato/NetPeek"
license=(GPL-3.0-or-later)
depends=(python python-gobject gtk4)
makedepends=(git meson ninja)
provides=(netpeek)
conflicts=(netpeek)
source=("git+https://github.com/ZingyTomato/NetPeek.git")
sha256sums=('SKIP')

pkgver() {
  cd NetPeek
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd NetPeek
  arch-meson build
  ninja -C build
}

package() {
  cd NetPeek
  DESTDIR="${pkgdir}" ninja -C build install
}
