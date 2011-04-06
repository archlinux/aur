# Maintainer: Cedric Girard <girard.cedric@gmail.com>
pkgname=unarchiver
pkgver=2.6
pkgrel=1
pkgdesc="An Objective-C application for uncompressing archive files"
arch=('x86_64' 'i686')
url="http://wakaba.c3.cx/s/apps/unarchiver.html"
license=('LGPL')
depends=('gnustep-base' 'openssl' 'bzip2' 'icu' 'gcc-libs' 'zlib')
makedepends=('gcc-objc')
source=(http://theunarchiver.googlecode.com/files/TheUnarchiver"$pkgver"_src.zip unarchiver-makefile.patch)
md5sums=('91144dcaf1d41ac5b38ae39eb6c3fea4'
         '974025c5a7489409fbd101ee598f8dfd')

build() {
  cd "$srcdir/The Unarchiver/"

  #remove unneeded and non LGPL compatible files
  rm -rf "BadLicense" "The Unarchiver"
  
  patch -p1 < ../../unarchiver-makefile.patch

  cd XADMaster

  . /opt/GNUstep/System/Library/Makefiles/GNUstep.sh
  make -f Makefile.linux
}

package() {
  cd "$srcdir/The Unarchiver/XADMaster"
  install -d "$pkgdir/usr/bin/"
  cp unar lsar "$pkgdir/usr/bin/"
}

# vim:set ts=2 sw=2 et:
