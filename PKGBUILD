# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Maintainer: GordonGR <ntheo1979@gmail.com>

_pkgname=libdvdnav
pkgname=lib32-${_pkgname}
pkgver=5.0.2
pkgrel=1
pkgdesc="The library for xine-dvdnav plugin (32 bit)"
arch=('x86_64')
license=('GPL')
url="http://dvdnav.mplayerhq.hu/"
depends=('lib32-libdvdread' "${_pkgname}")
makedepends=('git')
source=(git://git.videolan.org/libdvdnav.git#tag=$pkgver
		Fix-reading-DVD-label.patch)
md5sums=('SKIP'
         'a92e0638a7cbe5f0e11458a05cf5fb8a')

prepare() {
cd "${_pkgname}"
patch -Np1 -i ../Fix-reading-DVD-label.patch
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
