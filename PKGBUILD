# Contributor: GordonGR <ntheo1979@gmail.com>
# Maintainer: josephgbr <rafael.f.f1@gmail.com>

_pkgname=liblrdf
pkgname=lib32-${_pkgname}
pkgver=0.5.0
pkgrel=3
pkgdesc="A library for the manipulation of RDF file in LADSPA plugins (32 bit)"
arch=('x86_64')
url="https://github.com/swh/LRDF"
depends=('lib32-raptor' "$_pkgname")
makedepends=('gcc-multilib')
license=('GPL')
source=(${_pkgname}-${pkgver}.tar.gz::https://github.com/swh/LRDF/tarball/${pkgver})
md5sums=('005ea24152620da7f2ee80a78e17f784')

build() {
export CC='gcc -m32'
export CXX='g++ -m32'
export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
cd swh-LRDF-7ebc032
sed -i 's#AM_CONFIG_HEADER(config.h)#AC_CONFIG_HEADERS([config.h])#' configure.ac

autoreconf -vfi
./configure --prefix=/usr --libdir=/usr/lib32
make
}

package() {
cd swh-LRDF-7ebc032
make DESTDIR="${pkgdir}" install
rm -rf "${pkgdir}"/usr/{include,share}
}
