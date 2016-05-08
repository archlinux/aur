# Contributor: GordonGR <ntheo1979@gmail.com>
# Maintainer: josephgbr <rafael.f.f1@gmail.com>

_pkgname=libcdaudio
pkgname=lib32-${_pkgname}
_pkgver=0.99.12p2
pkgver=0.99.12.p2
pkgrel=1
pkgdesc="Library for controlling Audio CDs and interacting with CDDB (32 bit)"
arch=('x86_64')
url="http://libcdaudio.sourceforge.net/"
license=('GPL')
depends=('lib32-glibc' "${_pkgname}")
makedepends=('gcc-multilib')
source=("http://downloads.sourceforge.net/sourceforge/libcdaudio/${_pkgname}-${_pkgver}.tar.gz"
        '01-cddb-bufferoverflow.patch'
        '02-cddb-bufferoverflow.patch')
md5sums=('15de3830b751818a54a42899bd3ae72c'
         'f78c881b92cd7d25472daa90af284e18'
         'e36755c125d2710dc8619bb401e37444')

build() {
export CC='gcc -m32'
export CXX='g++ -m32'
export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
cd ${_pkgname}-${_pkgver}
patch -Np1 -i "${srcdir}/01-cddb-bufferoverflow.patch"
patch -Np1 -i "${srcdir}/02-cddb-bufferoverflow.patch"
./configure --prefix=/usr --libdir=/usr/lib32
make
}

package() {
cd ${_pkgname}-${_pkgver}
make DESTDIR="${pkgdir}" install
rm -rf "${pkgdir}/usr"/{bin,include,share}
}
