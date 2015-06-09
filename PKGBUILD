# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=bonanza
pkgver=6.0
pkgrel=5
pkgdesc="The Computer Shogi Program"
arch=('i686' 'x86_64')
url="http://www.geocities.jp/bonanza_shogi/"
source=("http://gi.cs.uec.ac.jp:10140/${pkgname}_v${pkgver}.zip"
'shogidokoro_usi_20140611.patch'
'bonanza'
'Makefile.patch')
license=('CUSTOM')
install="bonanza.install"
md5sums=('7e993748c8fd596dc6756e04c4732b5c'
         '708675832b9c56fa807b78fa3a321f70'
         '7224c254dd6cf5812b5feea20c675ae2'
         'e47b5538512d03bf61d60ed97d8fa937')

prepare() {
  cd ${pkgname}_v$pkgver
  patch -p1 --verbose -i $srcdir/shogidokoro_usi_20140611.patch
  patch -p1 --verbose -i $srcdir/Makefile.patch
}

build() {
  cd ${pkgname}_v$pkgver/src/client

  make gcc
}

package() {
  cd ${pkgname}_v$pkgver

  mkdir -m755 -p $pkgdir/opt/$pkgname/log
  install -m755 ./src/client/$pkgname ./winbin/*.bin $pkgdir/opt/$pkgname/
  install -Dm755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:
