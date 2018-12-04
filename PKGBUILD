# Contributor: archtux <antonio dot arias99999 at gmail dot com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=cboard
pkgver=0.7.5
pkgrel=1
pkgdesc="An NCurses PGN browser, editor, and front end to chess engines that use the XBoard protocol." 
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/c-board/"
license=('GPL2')
depends=('ncurses')
source=("http://downloads.sourceforge.net/project/c-board/$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('8818cf2a2202fa0fcf1be7cfbedec021')
sha1sums=('b27240f41ae385ef09558e2cd2056f0685127e4f')
sha256sums=('dd748039f3531653e1573577cd814741524e1b16e16e3a841ef512e5150da6a0')

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

