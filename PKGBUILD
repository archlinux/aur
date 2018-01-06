# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Packager: cs-cam - me.at.camdaniel.com

pkgname=obexfs
pkgver=0.12
pkgrel=4
pkgdesc="FUSE based filesystem using ObexFTP (currently beta)."
arch=('x86_64')
url="http://openobex.triq.net/obexfs"
license=('GPL')
source=(http://triq.net/obexftp/$pkgname-$pkgver.tar.gz)
depends=('fuse2' 'obexftp>=0.22')
md5sums=('0f505672b025cdb505e215ee707a2e2f')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  export OBEXFTP_CFLAGS="-I/usr/include/obexftp -I/usr/include/multicobex -I/usr/include/bfb"
  export OBEXFTP_LIBS="-lobexftp -lmulticobex -lbfb -lopenobex -lbluetooth"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
