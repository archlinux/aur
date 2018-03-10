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
source=("https://downloads.sourceforge.net/openobex/${pkgname}-${pkgver}.tar.gz")
depends=('fuse2' 'obexftp>=0.22')
sha512sums=('f9b9c7c220271b7bf538d748beb3cb7fabd0377ef74855a959f7595755904be739ed5995909f423a40218d05a71de6b48a5ef471e2dc0934164aba2805c7e2e0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export OBEXFTP_CFLAGS="-I/usr/include/obexftp -I/usr/include/multicobex -I/usr/include/bfb"
  export OBEXFTP_LIBS="-lobexftp -lmulticobex -lbfb -lopenobex -lbluetooth"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="$pkgdir" install
}
