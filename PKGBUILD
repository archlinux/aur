# Maintainer: Erich Eckner <arch at eckner dot net>
pkgname=zdkimfilter
pkgver=3.0
pkgrel=2
pkgdesc="zDKIM filter for Courier-MTA using the OpenDKIM Project's library."
arch=('i686' 'pentium4' 'x86_64')
url='https://www.tana.it/sw/zdkimfilter/'
license=('GPL3')
_pinned_dependencies=(
  'glibc>=2.31'
  'libbsd=0.10.0'
  'libidn2.so=0'
  'libnettle.so=8'
  'libunistring.so=2'
  'libuuid.so=1'
  'opendbx=1.4.6'
  'openssl=1.1.1.h'
  'zlib=1:1.2.11'
)
depends=(
  'courier-mta'
  'opendkim'
  "${_pinned_dependencies[@]}"
)
backup=('etc/courier/filters/zdkimfilter.conf')
source=(
  "http://www.tana.it/sw/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.asc}
)
sha512sums=('bfccb1db7db474819ef2191551bf31bee12387b824dae9c8e8266d1b2c508b33cf7e34ce629bf054d451ef67af06ba19c3b69b4947ac154a8927a980d3940f9f'
            'SKIP')
validpgpkeys=('0A5B4BB141A53F7F55FC8CBCB6ACF44490D17C00')
options=('debug' '!strip')

build() {

  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --with-courier-version=60
  make

}

package() {

  cd ${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  mv "${pkgdir}/etc/courier/filters/zdkimfilter.conf"{.dist,}

}
