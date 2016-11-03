# Maintainer: Justin Dray <justin@dray.be>
# Contributor: David Roheim <david dot roheim at gmail dot com>
# Contributor: DrZaius <lou[at]fakeoutdoorsman[dot]com>
pkgname=lib32-vo-amrwbenc
_pkgname=vo-amrwbenc
pkgver=0.1.3
pkgrel=1
pkgdesc="VisualOn Adaptive Multi Rate Wideband (AMR-WB) encoder"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/opencore-amr/"
license=('APACHE')
depends=('glibc')
options=('!emptydirs' '!libtool')
source=(https://repo.dray.be/package-files/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('5652b391e0f0e296417b841b02987d3fd33e6c0af342c69542cbb016a71d9d4e')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf $pkgdir/usr/include
}
