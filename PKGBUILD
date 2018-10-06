# $Id$
# Maintainer: Pieter Lenaerts <pieter dot aj dot lenaerts gmail>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=alsa-lib-x205ta
pkgver=1.1.6
pkgrel=2
pkgdesc="An alternative implementation of Linux sound support, with UCM files for the ASUS x205ta."
arch=('x86_64')
url="http://www.alsa-project.org"
depends=('glibc')
optdepends=('python2: for python smixer plugin')
makedepends=('python2')
provides=("${pkgname%-x205ta}=$pkgver")
conflicts=('alsa-lib')
license=('LGPL')
source=(ftp://ftp.alsa-project.org/pub/lib/${pkgname%-x205ta}-$pkgver.tar.bz2
	https://raw.githubusercontent.com/plbossart/UCM/c8b344ca650a62aa809242b0c9ba908eac963125/chtrt5645/chtrt5645.conf
	https://raw.githubusercontent.com/plbossart/UCM/c7405e6f03eb2404edb38b495c27225364bf16f4/sof-chtrt5645/HiFi.conf
	)
sha256sums=('5f2cd274b272cae0d0d111e8a9e363f08783329157e8dd68b3de0c096de6d724'
            '8d0ede122c8b881978af8a3cbae194129675fed59eda584931489e95b3d27f0b'
            'f206ed6bdba1c0e0266953ef76b677fa825a3965ab4b0eb265fcd1a5c629f9d7')

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

