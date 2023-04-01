# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Jared Casper <jaredcasper@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gerbv
pkgver=2.9.5
pkgrel=1
pkgdesc="An open source Gerber file (RS-274X only) viewer"
#url="http://gerbv.gpleda.org/"
url="http://gerbv.geda-project.org/"
license=('GPL')
arch=('x86_64')
depends=('gtk2' 'dconf')
optdepends=('cairo: for better graphics')
changelog=ChangeLog
#source=("https://downloads.sourceforge.net/gerbv/$pkgname-$pkgver.tar.gz")
source=("gerbv-$pkgver.tgz::https://github.com/gerbv/gerbv/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a90b3e50941bed90eaf45e9b0d19b2d074eec1f433dcf3a1b3cbf14d8dc7c1ec')

prepare () {
  cd $pkgname-$pkgver
  sed -i "21 i VERSION=$pkgver" src/Makefile.am
  sed -i "64 i #define VERSION \"$pkgver\"" src/gerbv.h
}

build () {
  cd $pkgname-$pkgver
  ./autogen.sh
#  sed -i 's|am_aux_dir=`cd $ac_aux_dir|am_aux_dir=`cd $srcdir|' configure
  ./configure --prefix=/usr \
              --disable-update-desktop-database 
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install 
}

