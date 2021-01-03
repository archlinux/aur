# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Ryan Farley <ryan.farley@gmx.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Krzysztof Stasiorowski <krzysiekst@gmail.com>

pkgname=qpxtool
pkgver=0.8.1
pkgrel=1
pkgdesc="Allows better controll over optical drives to include QChecks and optimization settings."
arch=('x86_64')
url="http://qpxtool.sourceforge.net/"
license=('GPL')
depends=('qt5-base')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('33f210de24ef8dd7c7adac6b41ac8328')


build() {
  cd "$srcdir"/$pkgname-$pkgver
  # Fix strict aliasing warnings
  export CFLAGS="$CFLAGS -fno-strict-aliasing"
  #sed -i \
  #  -e 's|lib64|lib|' \
  #  -e 's|lrelease|lrelease-qt4|' \
  #  configure
  #patch -p1 <"$srcdir"/libpng15.patch
  ./configure --prefix=/usr --sbindir=/usr/bin --libdir=/usr/lib
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  mkdir -p "$pkgdir"/usr/bin
  make DESTDIR="$pkgdir" install
}
