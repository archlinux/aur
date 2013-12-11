# Maintainer: carstene1ns <arch carsten-teibes de>

pkgname=devkitppc-portlibs-libjpeg
pkgver=8d
pkgrel=1
pkgdesc='Library of JPEG support fuctions'
arch=('any')
url='http://www.ijg.org/'
license=('custom')
options=(!strip libtool staticlibs)
depends=('devkitppc')
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/jpeg-$pkgver.tar.bz2")
md5sums=('9858d03ba65352bc5f579511741b9454')
sha256sums=('8315375a8bace8b903a9f22aa10e398572efabd35eb1c12d74c1515d32f1fba9')

build() {
  source /etc/profile.d/devkitppc.sh
  export CFLAGS="-g -O2"
  cd jpeg-$pkgver

  ./configure --prefix=$DEVKITPRO/portlibs/ppc --host=powerpc-eabi \
              --disable-shared --enable-static

  make libjpeg.la # only build library, no programs
}

package() {
  cd jpeg-$pkgver

  DESTDIR=$pkgdir make install-data-local install-includeHEADERS \
                       install-libLTLIBRARIES # only install headers and library
}
