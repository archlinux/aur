# Contributor: archtux <antonio dot arias99999 at gmail dot com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=cboard
pkgver=0.7.1
pkgrel=1
pkgdesc="An NCurses PGN browser, editor, and front end to chess engines that use the XBoard protocol." 
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/c-board/"
license=('GPL2')
depends=('ncurses')
source=("http://downloads.sourceforge.net/project/c-board/$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('e1763a55c9c36e7b7209d05a25df89c8')
sha1sums=('d0fe491685de4a2a084802ec2fe94d6b570939f3')
sha256sums=('989c58181f16be0775a9b11b97766a79df4931660ca18f1e93e4cd51e9d6b743')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --without-ncursesw
  sed -i 's|O_CREAT|O_CREAT, 0666|' libchess/pgn.c 
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir install
}

