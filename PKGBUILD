# Contributor: GordonGR <ntheo1979@gmail.com>
# Maintainer: josephgbr <rafael.f.f1@gmail.com>

_pkgname=liblrdf
pkgname=lib32-${_pkgname}
pkgver=0.6.1
pkgrel=1
pkgdesc="A library for the manipulation of RDF file in LADSPA plugins (32 bit)"
arch=('x86_64')
url="https://github.com/swh/LRDF"
depends=('lib32-raptor' "$_pkgname")
makedepends=('gcc-multilib')
license=('GPL2')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/swh/LRDF/archive/v${pkgver}.tar.gz")
md5sums=('8bb0ac7e8fe1a5a90083c89776bd3deb')

prepare() {
mv -v "LRDF-${pkgver}" "${_pkgname}-${pkgver}"
cd "${_pkgname}-${pkgver}"
autoreconf -vfi
sed -e 's,raptor.h,raptor2/raptor.h,' -i lrdf.h
}

build() {
cd "${_pkgname}-${pkgver}"

export CC='gcc -m32'
export CXX='g++ -m32'
export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

./configure --prefix=/usr --libdir=/usr/lib32
make
}

package() {
cd "${_pkgname}-${pkgver}"
make DESTDIR="${pkgdir}" install
rm -rf "${pkgdir}"/usr/{include,share}
}
