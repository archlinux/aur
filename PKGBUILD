# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Weston Hanners <weston@hanners.us>

_pkgname=crawl
pkgname=crawl-git
pkgver=0.17.a0.r1020.ge683cc4
pkgrel=1
pkgdesc="A modern roguelike game played in the console."
arch=('i686' 'x86_64')
url="http://crawl.develz.org"
license=('GPL')
depends=('zlib' 'ncurses')
makedepends=('git')
source=(git+https://gitorious.org/$_pkgname/${pkgname//-/.})
md5sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname
  git submodule init
  git submodule update
}

build() {
  cd "$srcdir"/$_pkgname/$_pkgname-ref/source/
  make NO_LUA_BINDINGS=Y
}

package() {
  cd "$srcdir"/crawl/crawl-ref/source/
  make prefix=/usr/local/ DESTDIR="$pkgdir/" install
}
