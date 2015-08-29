# $Id: PKGBUILD 112021 2014-05-28 16:30:26Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Tor Krill <tor@krill.nu>
# Contributor: Lee.MaRS <leemars@gmail.com>

pkgname=gsoap287
pkgver=2.8.7
pkgrel=4
pkgdesc="Offers an XML language binding to ease the development of SOAP/XML Web services in C and C/C++"
url="http://www.cs.fsu.edu/~engelen/soap.html"
arch=('i686' 'x86_64')
license=('GPL' 'custom')
depends=('openssl' 'zlib' 'gcc-libs')
makedepends=('autoconf' 'automake')
options=('staticlibs')
conflicts=('gsoap')
provides=('gsoap')
source=(http://prdownloads.sourceforge.net/gsoap2/gsoap_${pkgver}.zip
	LICENSE.gsoap)
md5sums=('48a8dfddffd8f10b3ca82a6a9583e206'
         '27aaa3f5166db94d44044c11a7b2c37b')

build() {
  cd $srcdir/gsoap-2.8
  ./configure --prefix=/usr --enable-openssl
  make -j1
}

package() {
  cd $srcdir/gsoap-2.8
  make DESTDIR=$pkgdir install
  mkdir -p $pkgdir/usr/share/gsoap/import
  mkdir -p $pkgdir/usr/share/gsoap/WS
  cp -R gsoap/import $pkgdir/usr/share/gsoap/
  cp -R gsoap/WS $pkgdir/usr/share/gsoap/
  install -D ../LICENSE.gsoap $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
