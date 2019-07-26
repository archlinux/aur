# Contributor: Florian Knodt <adlerweb@adlerweb.info>
# Maintainer: Jose Riha <jose 1711 gmail com>

pkgname=ssvnc
pkgver=1.0.29
pkgrel=10
pkgdesc="SSL/SSH VNC viewer"
arch=('i686' 'x86_64')
url="http://www.karlrunge.com/x11vnc/ssvnc.html"
license=('GPL')
groups=('network')
depends=('libjpeg>=7' 'libxaw' 'openssl' 'java-runtime' 'tk' 'tcl' 'stunnel')
makedepends=('imake' 'java-environment')
optdepends=('perl' 'xterm' 'smbclient' 'avahi')
source=(http://downloads.sf.net/sourceforge/$pkgname/$pkgname-$pkgver.src.tar.gz
        openssl1.1.patch
        Makefile.patch)
md5sums=('52201aeb0417c2a0fe83639e52da6ae5'
         '6a119a5748a231f63c96044a2761845f'
         '7d35673003f4f25a046c48f803e76e65')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < "$srcdir/openssl1.1.patch"
  patch -p0 < "$srcdir/Makefile.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i '/wr_tool/s/\$(PREFIX)\/\$(LIB)\/\([^/]*$\)/\/usr\/lib\/ssvnc\/\1/' Makefile
  make config
  make all
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" MANDIR="share/man" install
}

# vim:set ts=2 sw=2 et:
