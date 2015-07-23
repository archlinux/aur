# Contributor: GordonGR <ntheo1979@gmail.com>
# Maintainer: josephgbr <rafael.f.f1@gmail.com>

_pkgname=libcdaudio
pkgname=lib32-${_pkgname}
pkgver=0.99.12
pkgrel=2
pkgdesc="Library for controlling Audio CDs and interacting with CDDB (32 bit)"
arch=('x86_64')
url="http://libcdaudio.sourceforge.net/"
license=('GPL')
depends=('lib32-glibc' "${_pkgname}")
makedepends=('gcc-multilib')
source=("http://downloads.sourceforge.net/sourceforge/libcdaudio/${_pkgname}-${pkgver}.tar.gz"
        '01-cddb-bufferoverflow.patch'
        '02-cddb-bufferoverflow.patch')
md5sums=('63b49cf14d53eed31e7a87cca17a3963'
         'f78c881b92cd7d25472daa90af284e18'
         'e36755c125d2710dc8619bb401e37444')

build() {
export CC='gcc -m32'
export CXX='g++ -m32'
export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
cd ${_pkgname}-${pkgver}
patch -Np1 -i "${srcdir}/01-cddb-bufferoverflow.patch"
patch -Np1 -i "${srcdir}/02-cddb-bufferoverflow.patch"
./configure --prefix=/usr --libdir=/usr/lib32
make
}

package() {
cd ${_pkgname}-${pkgver}
make DESTDIR="${pkgdir}" install
rm -rf "${pkgdir}/usr"/{bin,include,share}
}
