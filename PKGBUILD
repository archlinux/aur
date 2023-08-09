# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Bjorn Lindeijer <bjorn lindeijer nl>
pkgname=sofia-sip
pkgver=1.13.16
pkgrel=1
pkgdesc="An open-source SIP User-Agent library"
arch=('x86_64' 'i686')
url="http://sofia-sip.sourceforge.net"
license=('LGPL')
depends=('glib2' 'openssl' 'gawk')
source=($pkgname-$pkgver.tar.gz::https://github.com/freeswitch/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
md5sums=('777358bd504a76517a9d510c7aa78204')
sha512sums=('29a5bd1e38b5b80d6cd6aeb6f3cff3c93660314a8577b550975ad6eddbc8a2ce341dff3f510cb4f24037bfb0ce5ada142b130a9576a8d6acfb06a38088cdcf50')

prepare() {
  cd $pkgname-$pkgver
  ./autogen.sh
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-openssl
  # Fight unused direct deps
  sed -i -e "s/ -shared / $LDFLAGS\0 /g" libtool
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
