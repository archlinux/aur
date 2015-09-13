# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Maintainer: GordonGR <ntheo1979@gmail.com>

_pkgname=libdvdnav
pkgname=lib32-${_pkgname}
pkgver=5.0.3
pkgrel=1
pkgdesc="The library for xine-dvdnav plugin (32 bit)"
arch=('x86_64')
license=('GPL')
url="http://dvdnav.mplayerhq.hu/"
depends=('lib32-libdvdread>=5.0.2' "${_pkgname}")
makedepends=('git')
source=(git://git.videolan.org/libdvdnav.git#tag=$pkgver
	fix-crash-describe_title.patch)
		
md5sums=('SKIP'
         'a23f89f9175a36f04b5e202bd4e35baa')

prepare() {
cd "${_pkgname}"
patch -Np1 -i ../fix-crash-describe_title.patch
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
