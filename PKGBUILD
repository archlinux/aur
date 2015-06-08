# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_pkgname=libdvdread
pkgname=lib32-${_pkgname}
pkgver=5.0.1
pkgrel=1
pkgdesc="Provides a simple foundation for reading DVD video disks (32 bit)"
arch=('x86_64')
url="http://dvdnav.mplayerhq.hu"
license=('GPL')
depends=('lib32-glibc' "${_pkgname}")
makedepends=('lib32-libdvdcss' 'git')
options=('!libtool')
source=(git://git.videolan.org/libdvdread.git#tag=$pkgver)
md5sums=('SKIP')

prepare() {
cd $_pkgname
autoreconf -fi
}


build() {
export CC='gcc -m32'
export CXX='g++ -m32'
export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
cd "${_pkgname}"
./configure --prefix=/usr --libdir=/usr/lib32
make
}

package() {
cd "${_pkgname}"
make DESTDIR="${pkgdir}" install
rm -rf "${pkgdir}/usr"/{bin,include,share}
}
