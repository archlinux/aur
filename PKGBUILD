# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: josephgbr <rafael.f.f1 at gmail dot com>
# Contributor: escoand <passtschu at freenet.de>

_pkgname=faad2
pkgname=lib32-${_pkgname}
pkgver=2.8.1
pkgrel=1
pkgdesc="ISO AAC audio decoder (32 bit)"
arch=('x86_64')
url="http://www.audiocoding.com/"
license=('GPL' 'custom:FAAD2')
depends=('lib32-glibc' ${_pkgname})
options=('!makeflags')
source=("http://downloads.sourceforge.net/sourceforge/faac/${_pkgname}-${pkgver}.tar.bz2"
	'faad2-2.7-libmp4ff-install-mp4ff_int_types_h.patch'
	'faad2-2.7-libmp4ff-shared-lib.patch')
md5sums=('c0c0d1e6d66de38c40ae56a1981321f9'
         'b33354022bc1696a89b3ccc1ab94c54f'
         'b23d2853fec6f07ae7769fd4eabd8f42')


prepare() {
cd ${_pkgname}-${pkgver}
#patch -p1 -i "${srcdir}/faad2-2.7-libmp4ff-shared-lib.patch"
#patch -p0 -i "${srcdir}/faad2-2.7-libmp4ff-install-mp4ff_int_types_h.patch"
#autoreconf --force --install
}

build() {
export CC='gcc -m32'
export CXX='g++ -m32'
export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
    
cd ${_pkgname}-${pkgver}
./bootstrap
./configure --prefix=/usr --libdir=/usr/lib32
make
}

package() {
cd ${_pkgname}-${pkgver}
make DESTDIR="${pkgdir}" install
rm -rf "${pkgdir}/usr"/{bin,include,share}
cd ..
}
