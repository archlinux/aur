# Maintainer: Erich Eckner <arch at eckner dot net>
pkgname=zdkimfilter
pkgver=3.8
pkgrel=2
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
sha512sums=('8ddc57bb90c61df17ab377c92861134a123d11b028e98af4a22a5ad8039a65950244f5d828667c0665f7a9d777080a11717b03b95a8609b2627eb2de367ee08d'
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
