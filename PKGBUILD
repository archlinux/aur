# Maintainer: Daneel <aur@gnoulibre.org>

pkgname=bombardier-git
pkgver=0.8.3.r0.g8a1d51d
pkgrel=2
pkgdesc="The GNU Bombing utility (text game)"
arch=(i686 x86_64)
url="https://anonscm.debian.org/cgit/collab-maint/bombardier.git/"
license=('GPL3')
conflicts=('bombardier')
depends=('ncurses')
makedepends=('git' 'gcc')
source=('bombardier-git::git://anonscm.debian.org/collab-maint/bombardier.git#branch=master')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  basename $(git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  sed -i 's_/usr/games_/usr/bin_g' Makefile
  make DESTDIR="$pkgdir/" install
}

