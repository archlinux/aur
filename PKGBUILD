# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=gpsfish
pkgver=r61
pkgrel=3
pkgdesc="Shogi program ported from Stockfish combined with GPSShogi's evaluation function and other shogi stuffs"
arch=('i686' 'x86_64')
url='http://gps.tanaka.ecc.u-tokyo.ac.jp/gpsshogi/index.php?GPSFish'
license=('GPL')
depends=('libosl-svn' 'gpsshogi-svn' 'boost-libs')
makedepends=('boost')
source=("gpsfish.tar.gz::http://gps.tanaka.ecc.u-tokyo.ac.jp/cgi-bin/viewvc.cgi/branches/gpsfish_dev/?root=gpsfish&view=tar"
'Makefile.patch')
md5sums=('SKIP'
         '2b3f68dd79c59cb22e52a7cf47538e04')

pkgver() {
  curl -s 'http://gps.tanaka.ecc.u-tokyo.ac.jp/cgi-bin/viewvc.cgi/branches/gpsfish_dev/?root=gpsfish' |\
    sed -n -e 's/^.*revision=\([0-9]*\)".*$/r\1/p'
}

prepare() {
  cd $srcdir/gpsfish_dev/src
  patch --verbose -i $srcdir/Makefile.patch
}

build() {
  cd $srcdir/gpsfish_dev/src
  make
}

#check() {
#  cd $pkgname-$pkgver
#
#  make -k check
#}

package() {
  install -Dm755 $srcdir/gpsfish_dev/src/gpsfish $pkgdir/usr/bin/gpsfish
}

# vim:set ts=2 sw=2 et:
