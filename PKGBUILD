# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Bjorn Lindeijer <bjorn lindeijer nl>
pkgname=sofia-sip
pkgver=1.13.15
pkgrel=1
pkgdesc="An open-source SIP User-Agent library"
arch=('x86_64' 'i686')
url="http://sofia-sip.sourceforge.net"
license=('LGPL')
depends=('glib2' 'openssl' 'gawk')
source=($pkgname-$pkgver.tar.gz::https://github.com/freeswitch/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
md5sums=('8d52f62c3c39d29dc8a50d12cdcdec36')
sha512sums=('edc2d719ec93fca3daa5e5fea5128f2e52228890cb36e5fa862c97fe566f8a5c47c1eeab655744a5e8a7b0f6e9b80b8f8643fc7f3ecc9b0449ad58346efbdec4')

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
