# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: josephgbr <rafael.f.f1 at gmail dot com>
# Contributor: escoand <passtschu at freenet.de>

_pkgname=faad2
pkgname=lib32-${_pkgname}
pkgver=2.8.5
pkgrel=1
pkgdesc="ISO AAC audio decoder (32 bit)"
arch=('x86_64')
url="http://faac.sourceforge.net/"
license=('GPL')
depends=('lib32-glibc' ${_pkgname})
options=('!makeflags')
source=("http://downloads.sourceforge.net/sourceforge/faac/${_pkgname}-${pkgver}.tar.gz")
md5sums=('1ae7cea796d9cba488e70f8979663002')

build() {
export CC='gcc -m32'
export CXX='g++ -m32'
export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
    
cd ${_pkgname}-${pkgver}
./configure --prefix=/usr --libdir=/usr/lib32
make
}

package() {
cd ${_pkgname}-${pkgver}
make DESTDIR="${pkgdir}" install
rm -rf "${pkgdir}/usr"/{bin,include,share}
cd ..
}
