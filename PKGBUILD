# Maintainer: Clarence <xjh.azzbcc@gmail.com>
_pkgname=sofia-sip
pkgname=${_pkgname}-fs
pkgver=1.13.2
pkgrel=1
pkgdesc="An open-source SIP User-Agent library (FreeSWITCH version)"
arch=('x86_64')
url="https://github.com/freeswitch/sofia-sip"
license=('LGPL')
depends=('glib2' 'openssl' 'gawk')
provides=('sofia-sip')
conflicts=('sofia-sip')
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/freeswitch/$_pkgname/archive/v$pkgver.tar.gz"
        '0001-Compatible-with-the-new-version-of-libckeck.patch')
sha256sums=('b9eca9688ce4b28e062daf0933c3bf661fb607e7afafa71bda3e8f07eb88df44'
            '7e52ec8ee1340042982c2d7b5612e37b7140daea5e5b67e2bd392b2c367913de')

prepare() {
  cd "$_pkgname-$pkgver"
  patch -p1 -N -b -z .orig < ../0001-Compatible-with-the-new-version-of-libckeck.patch
}

build() {
  cd "$_pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
