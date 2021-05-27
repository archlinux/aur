# Maintainer: Erich Eckner <arch at eckner dot net>
pkgname=zdkimfilter
pkgver=3.4
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
  zdkimsign.patch
)
sha512sums=('a282764863efe0c09e05e7b58bc86f9637e81f1c6556589a77ee10d7d4c5192c0aa75446ffa3ffe931ce287c9ce9600a28dc12982be4874dd43c66dc86d4cd78'
            'SKIP'
            '388025ad0c3c298b9a3fcbfbba6ea62b050a5e1c564f8211c2206d9cdceeabe20dd3d08fafa6e74e86ccf0addf156078c2fd8d75615a3df3f6f4b7569eb29064')
validpgpkeys=('0A5B4BB141A53F7F55FC8CBCB6ACF44490D17C00')
options=('debug' '!strip')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p0 -i ../zdkimsign.patch
}

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
