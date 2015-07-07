# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
pkgname=ri-li
pkgver=2.0.1
pkgrel=3
pkgdesc="Drive a toy wood engine in many levels and collect all the coaches to win"
arch=('i686' 'x86_64')
url="http://ri-li.sourceforge.net/"
license=('GPL')
depends=('gcc-libs' 'sdl_mixer')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/Ri-li-$pkgver.tar.bz2 ri-li.desktop iostream.patch)
md5sums=('57a2ff50a0c704786da8adf61d78bf52' 'ff57f8b04b212af3e6f8c600c3e0c35b'
         'd953710f48bccf1f4de2f7d316c725fe')

build() {
  cd $srcdir/Ri-li-$pkgver
  ./configure --prefix=/usr
  sed -i "s/SUBDIRS = src data Sounds gentoo/SUBDIRS = src data Sounds/" Makefile
  patch -p1 < $srcdir/iostream.patch
  make || return 1
  make DESTDIR=$pkgdir install

  install -m644 -D ../ri-li.desktop $pkgdir/usr/share/applications/ri-li.desktop
  install -m644 -D data/Ri-li-icon-48x48.png $pkgdir/usr/share/pixmaps/ri-li.png
}
