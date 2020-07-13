# Maintainer sgerwk <sgerwk at aol dot com>
pkgname=felinks
pkgver=0.13.3
pkgrel=1
pkgdesc="text browser"
license=(GPL2)
arch=('x86_64' 'i686')
depends=(tre brotli libx11 openssl gpm zstd libidn expat ncurses)
conficts=(elinks elinks-git)
makedepends=('gcc' 'make')
url="http://github.com/rkd77/felinks"
source=(git+https://github.com/rkd77/felinks#tag=v$pkgver)
sha256sums=('SKIP')

build() {
  cd $startdir/src/$pkgname
  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
}

check() {
  cd $startdir/src/$pkgname
  return $(test -x src/elinks)
}

package() {
  cd $startdir/src/$pkgname
  make DESTDIR=$startdir/pkg/$pkgname install
  rm -f $startdir/pkg/$pkgname/usr/share/locale/locale.alias
}
