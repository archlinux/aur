# Maintainer: Erich Eckner <arch at eckner dot net>
pkgname=zdkimfilter
pkgver=1.7
pkgrel=2
pkgdesc="zDKIM filter for Courier-MTA using the OpenDKIM Project's library."
arch=('i686' 'pentium4' 'x86_64')
url='https://www.tana.it/sw/zdkimfilter/'
license=('GPL3')
depends=(
  'courier-mta'
  'opendkim'
  'opendbx'
  'nettle'
  'libidn2'
  'zlib')
backup=('etc/courier/filters/zdkimfilter.conf')
source=(
  "http://www.tana.it/sw/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.asc}
)
sha512sums=('7c9fe19f383922a46c906ab13d9dcc066531e704cb91bb293715948788e7879cb53d4e36c7c6e51b9027dfcc5d1047f9965df05d658918ba60adc59b3cfffb63'
            'SKIP')
validpgpkeys=('0A5B4BB141A53F7F55FC8CBCB6ACF44490D17C00')

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
