# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Bjorn Lindeijer <bjorn lindeijer nl>
pkgname=sofia-sip
pkgver=1.12.11
pkgrel=4
pkgdesc="An open-source SIP User-Agent library"
arch=('x86_64' 'i686')
url="http://sofia-sip.sourceforge.net"
options=('zipman')
license=('LGPL')
depends=('glib2' 'openssl')
source=(http://downloads.sourceforge.net/sofia-sip/${pkgname}-${pkgver}.tar.gz
	0001-fix-buggy-loop-hack.patch)
md5sums=('f3582c62080eeecd3fa4cd5d4ccb4225'
         'ad26f31dec412906443823f10e2fdab0')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -N -b -z .orig <../0001-fix-buggy-loop-hack.patch
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-openssl
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
