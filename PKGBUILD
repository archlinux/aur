# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Rick Rein <jeebusroxors@gmail.com>
# Contributor: Stefano Esposito <ragnarok@email.it>

pkgname=brutalchess
pkgver=0.5.2
pkgrel=6
pkgdesc="Chess game inspired by 'Battle Chess'. Features full 3D graphics."
url="http://sourceforge.net/projects/$pkgname"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('sdl_image' 'freetype2' 'glu')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-alpha-$pkgver-src.tar.gz")
md5sums=('370476b63091b8d82a9ea57c604dcbab')

prepare() {
  cd $pkgname-$pkgver/src
  sed '/<time.h>/ a\#include <limits.h>' -i brutalplayer.cpp
  sed 's/GLvoid/void/g'                  -i {md3view,objview}.cpp
  sed '/<string>/ a\#include <unistd.h>' -i {xboardplayer,faileplayer}.cpp
  sed 's~#include\ <freetype/~#include\ <freetype2/freetype/~g' -i fontloader.h
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --libexecdir=/usr/bin
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir install
}