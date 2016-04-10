# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Maintainer: GordonGR <ntheo1979@gmail.com>

_pkgname=raptor
pkgname=lib32-${_pkgname}
pkgver=2.0.15
pkgrel=3
pkgdesc="A C library that parses RDF/XML/N-Triples into RDF triples (32 bit)"
arch=('x86_64')
url="http://librdf.org/raptor"
depends=('lib32-curl' 'lib32-libxslt' 'lib32-icu' "${_pkgname}")
makedepends=('gcc-multilib')
license=('LGPL')
options=('!libtool')
source=("http://librdf.org/dist/source/raptor2-${pkgver}.tar.gz")
md5sums=('a39f6c07ddb20d7dd2ff1f95fa21e2cd')


build() {
export CC='gcc -m32'
export CXX='g++ -m32'
export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
cd raptor2-${pkgver}
./configure --prefix=/usr \
  --disable-static \
  --with-yajl=no \
  --with-icu-config=/usr/bin/icu-config-32 \
  --libdir=/usr/lib32
make
}

package() {
cd raptor2-${pkgver}
make prefix="${pkgdir}"/usr libdir="${pkgdir}"/usr/lib32 install
rm -rf "${pkgdir}"/usr/{bin,include,share}
}
