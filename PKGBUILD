# $Id$
# Maintainer: Pieter Lenaerts <pieter dot aj dot lenaerts gmail>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=alsa-lib-x205ta
pkgver=1.1.5
pkgrel=1
pkgdesc="An alternative implementation of Linux sound support, with UCM files at their right version for the ASUS x205ta from Pierre Bossart's git repository."
arch=('x86_64')
url="http://www.alsa-project.org"
depends=('glibc')
optdepends=('python2: for python smixer plugin')
makedepends=('python2')
provides=("${pkgname%-x205ta}=$pkgver")
conflicts=('alsa-lib')
license=('LGPL')
source=(ftp://ftp.alsa-project.org/pub/lib/${pkgname%-x205ta}-$pkgver.tar.bz2
	https://raw.githubusercontent.com/plbossart/UCM/c8b344ca650a62aa809242b0c9ba908eac963125/chtrt5645/HiFi.conf
	https://raw.githubusercontent.com/plbossart/UCM/c8b344ca650a62aa809242b0c9ba908eac963125/chtrt5645/chtrt5645.conf
	)

build() {
  cd "$srcdir/${pkgname%-x205ta}-$pkgver"
  ./configure --without-debug --prefix=/usr --with-pythonlibs="-lpthread -lm -ldl -lpython2.7" --with-pythonincludes=-I/usr/include/python2.7
  make
}

package() {
  cd "$srcdir/${pkgname%-x205ta}-$pkgver"
  make DESTDIR="$pkgdir" install
  cp "$srcdir/HiFi.conf" "$pkgdir/usr/share/alsa/ucm/chtrt5645/HiFi.conf"
  cp "$srcdir/chtrt5645.conf" "$pkgdir/usr/share/alsa/ucm/chtrt5645/chtrt5645.conf"
}
md5sums=('a2b465c3a5265d8a57f3ff39c6c4fc29'
         'ce609b7a60fb7db06d5a53126b91728c'
         '471fe244e731c10bb3bbca1386bfd8b5')
