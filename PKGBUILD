# Maintainer: MadTux <andreasgwilt@gmail.com>

pkgname=minetest-lott-git
pkgver=1.0.0.r25.ga0936cc
pkgrel=1
pkgdesc="A Lord of the Rings-based game for the Minetest engine."
arch=('any')
url="http://minetest.ig42.org/"
license=('LGPL')
depends=('minetest')

makedepends=('git')
source=("$pkgname::git://github.com/minetest-LOTT/Lord-of-the-Test.git")
md5sums=('SKIP')

pkgver() {
  cd ${_gitname:-$pkgname}
  git describe --long --tags 2>/dev/null | sed 's/[^[:digit:]]*\(.\+\)-\([[:digit:]]\+\)-g\([[:xdigit:]]\{7\}\)/\1.r\2.g\3/;t;q1'
  [ ${PIPESTATUS[0]} -ne 0 ] && \
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/share/minetest/games/Lord-of-the-Test"
  cp -r * "$pkgdir/usr/share/minetest/games/Lord-of-the-Test"
}
