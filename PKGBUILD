# Maintainer: Gergely Imreh <imrehg@gmail.com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Weston Hanners <weston@hanners.us>

pkgname=crawl-git
_pkgname=${pkgname%%-git}
pkgver=0.18.a0.r775.g4d9e04e
pkgrel=1
pkgdesc="Dungeon Crawl Stone Soup, a roguelike adventure through dungeons filled with dangerous monsters in a quest to find the mystifyingly fabulous Orb of Zot."
arch=('i686' 'x86_64')
url="http://crawl.develz.org"
license=('GPL')
depends=('zlib' 'ncurses')
makedepends=('git' 'gcc')
source=('git+https://github.com/crawl/crawl.git')
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  git submodule update --init
}

build() {
  cd "${srcdir}/${_pkgname}/${_pkgname}-ref/source/"
  make NO_LUA_BINDINGS=Y
}

package() {
  cd "${srcdir}/${_pkgname}/${_pkgname}-ref/source/"
  make prefix=/usr/local/ DESTDIR="${pkgdir}" install
}
