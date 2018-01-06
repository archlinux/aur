# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Roman Kyrylych <roman@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=gimmage
pkgver=0.2.3
pkgrel=7
pkgdesc="A gtkmm image viewer"
arch=('x86_64')
url="http://sourceforge.net/projects/gimmage.berlios/"
license=('GPL')
depends=('gtkmm' 'curl' 'file')
makedepends=('pkgconfig')
changelog=ChangeLog
source=(http://sourceforge.net/projects/gimmage.berlios/files/gimmage-$pkgver.tar.gz)
md5sums=('f51cca53b3d33415e75a91cf81b6ac39')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver
  rm gimmage.desktop
  sed -i 's|Exec=@prefix@/bin/gimmage|Exec=@prefix@/bin/gimmage %U|' gimmage.desktop.in
  sed -i '1,1i#include <string.h>' src/FileManager.cpp
  sed -i '1,1i#include <unistd.h>' src/FileManager.cpp
}

build() {
  cd "$srcdir"/$pkgname-$pkgver
  CXXFLAGS+=' -std=c++11'
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
