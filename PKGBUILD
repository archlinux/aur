# $Id: PKGBUILD 274702 2017-12-18 07:38:29Z arojas $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer : Gergely Imreh <imrehgATgmailDOTcom>
# Contributor : dschauer <dschauerATgmailDOTcom>
# Contributor : Stefan Husmann <stefan-husmann@t-online.de>
# Contributor : Jeremy Cowgar <jeremy@cowgar.com>

pkgname=tcc
pkgver=0.9.27
pkgrel=1
pkgdesc="Tiny C Compiler"
arch=('x86_64')
url="http://bellard.org/tcc/"
license=('LGPL')
depends=('glibc')
options=('docs' 'staticlibs')
source=(http://download.savannah.nongnu.org/releases/tinycc/${pkgname}-${pkgver}.tar.bz2)
md5sums=('SKIP')

build() {
  cd ${pkgname}-${pkgver}
  unset CFLAGS
  unset LDFLAGS
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}

 make DESTDIR="$pkgdir" docdir="$pkgdir"/usr/share/doc/tcc install

 make clean
 make CFLAGS="-fPIC"
 gcc -shared -o libtcc.so *.o
 install -Dm755 libtcc.so -t "${pkgdir}/usr/lib/"
}
