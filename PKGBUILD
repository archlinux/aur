# Contributor: Tibor Bamhor <tiborb95 at gmail dot com>
# Maintainer: Jason Gardner (buhrietoe at gmail dot com)

pkgname=ale
pkgver=0.9.0.3
pkgrel=2
pkgdesc="Anti-Lamenessing Engine - image enhancement tools"
url="http://repo.or.cz/w/Ale.git"
license="GPL"
arch=('i686' 'x86_64')
depends=('perl-exiftool' 'imagemagick' 'dcraw')

source=('https://dl.dropboxusercontent.com/u/51889968/ale-0.9.0.3.tar.gz')

md5sums=('ace3d9874577085112adbf409f27b069')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
#folowing is to support GC 4.3
# sed -i '/assert.h/a\
#\#include <cstring>' ui/ui.h || exit 0
  ./configure 
  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  cd ${pkgdir}
  mkdir -p usr/bin/
  cp usr/local/bin/* usr/bin
  rm -rf usr/local
}
