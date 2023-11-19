# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Bjorn Lindeijer <bjorn lindeijer nl>
pkgname=sofia-sip
pkgver=1.13.17
pkgrel=1
pkgdesc="An open-source SIP User-Agent library"
arch=('x86_64' 'i686')
url="http://sofia-sip.sourceforge.net"
license=('LGPL')
depends=('glib2' 'openssl' 'gawk')
source=($pkgname-$pkgver.tar.gz::https://github.com/freeswitch/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
md5sums=('587748d1d2c5340b058b44281693423c')
sha512sums=('356577d415d6dc4191f0f49f7fa1d6f33fafdb9e455556f83e091159055a215fc1ebfa9c7dc23b5f5e533b85e23afa7b1444170419fdf137aeb2ea048de77e08')

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
