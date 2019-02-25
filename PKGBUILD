# Maintainer: RISKO Gergely <risko@debian.org>
# Contributor: Daneel <aur@gnoulibre.org>

pkgname=bombardier-git
pkgver=0.8.3.r0.g8a1d51d
pkgrel=4
pkgdesc="The GNU Bombing utility (text game)"
arch=(i686 x86_64)
url="https://alioth-archive.debian.org/git/collab-maint/"
license=('GPL3')
conflicts=('bombardier')
depends=('ncurses')
makedepends=('git' 'gcc')
source=(https://alioth-archive.debian.org/git/collab-maint/bombardier.git.tar.xz)
sha256sums=('8a604420ddce28881d1c21ea1227edbaa1ac899ed3ec96d68a6745bfca82df8a')

prepare() {
  git clone 'bombardier.git' "$pkgname"
}

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

