# Maintainer: Stefan Husmann <stefan.husmann@t-online.de>

pkgname=dired
pkgver=305
pkgrel=8
pkgdesc="The very first filebrowser"
arch=('i686' 'x86_64')
url="http://www.sfr-fresh.com/linux/misc/old/"
license=('GPL')
depends=('ncurses')
source=("dired.zip::https://codeload.github.com/stefanhusmann/dired/zip/master")
md5sums=('3b6e6b36cf57f0aaf97e6ed0e75eefa9')
options=('!makeflags')

build()	{
  cd $srcdir/$pkgname-master
  sed -i 's/-lbsd -ltermcap/-lcurses/g' Makefile 
  sed -i "s#/usr/local#$pkgdir/usr#g" Makefile
  sed -i 's+getline+getline_dired+' dired.c
  make MANDIR=/usr/share/man linux 
}

package() {
  cd $srcdir/$pkgname-master
  install -d $pkgdir/usr/{bin,share/man}
  make MANDIR=$pkgdir/usr/share/man install
}
