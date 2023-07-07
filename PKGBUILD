# Maintainer: Erich Eckner <arch at eckner dot net>
pkgname=zdkimfilter
pkgver=3.15
pkgrel=1
pkgdesc="zDKIM filter for Courier-MTA using the OpenDKIM Project's library."
arch=('i686' 'pentium4' 'x86_64')
url='https://www.tana.it/sw/zdkimfilter/'
license=('GPL3')
depends=(
  'courier-mta'
  'opendkim'
  'libbsd'
  'libidn2.so'
  'libnettle.so'
  'libunistring.so'
  'libuuid.so'
  'opendbx'
  'openssl'
  'zlib'
)
backup=('etc/courier/filters/zdkimfilter.conf')
source=(
  "http://www.tana.it/sw/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.asc}
)
sha512sums=('9df73cb246146cd217704887d4e3d78460e492803337cf75b4fcdc28c0ac0565d84340f85d07891af5b07d36b34aedf45182bb52ef53ac30e6ae3d8dec53977c'
            'SKIP')
validpgpkeys=('0A5B4BB141A53F7F55FC8CBCB6ACF44490D17C00')
options=('debug' '!strip')

build() {

  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --with-courier-version=60 --with-openssl --without-gnutls
  make

}

package() {

  cd ${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  mv "${pkgdir}/etc/courier/filters/zdkimfilter.conf"{.dist,}

}
