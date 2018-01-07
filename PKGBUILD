# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>

pkgname=libsynaptics
pkgver=0.14.6c
pkgrel=7
pkgdesc="Library for accessing synaptics touchpads"
arch=('x86_64')
url="http://qsynaptics.sourceforge.net"
license=('GPL')
depends=('gcc-libs')
makedepends=('xproto')
source=(http://qsynaptics.sourceforge.net/$pkgname-$pkgver.tar.bz2 libsynaptics-gcc433.patch)
md5sums=('fedf8b31171d288954ff2e83b251de44'
         '5e1df34fe8c2480b803a8ea6520bdda8')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  patch -Np0 -i ../libsynaptics-gcc433.patch
  sed -i '1,1i#include <stdio.h>' pad.cpp
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
