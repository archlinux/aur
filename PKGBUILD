# Maintainer: Filippo Squillace <feel dot sqoox at gmail dot com>
# Maintainer: polyzen <polycitizen@gmail.com>
# Contributor: mickael9 <mickael9 at gmail dot com>

pkgname=bitlbee-facebook-git
pkgver=v1.2.1.r7.49ea312
pkgrel=1
pkgdesc='Facebook protocol plugin for BitlBee'
arch=('any')
url='https://github.com/bitlbee/bitlbee-facebook'
license=('GPL')
depends=('bitlbee' 'json-glib')
makedepends=('git')
provides=('bitlbee-facebook')
conflicts=('bitlbee-facebook')

source=("git+https://github.com/bitlbee/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"

# The examples below are not absolute and need to be adapted to each repo. The
# primary goal is to generate version numbers that will increase according to
# pacman's version comparisons with later commits to the repo. The format
# VERSION='VER_NUM.rREV_NUM.HASH', or a relevant subset in case VER_NUM or HASH
# are not available, is recommended.

# Git, tags available
printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
# printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
  cd "$srcdir/${pkgname%-git}"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
