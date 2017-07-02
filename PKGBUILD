# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_pkgname=libmp4v2
pkgname=lib32-$_pkgname
pkgver=2.0.0
pkgrel=5
pkgdesc="MPEG-4 library (32 bit)"
arch=('x86_64')
url="http://code.google.com/p/mp4v2/"
license=('LGPL')
depends=("${_pkgname}" 'lib32-gcc-libs')
makedepends=('gcc-multilib')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/mp4v2/mp4v2-${pkgver}.tar.bz2"
	"libmp4v2-gcc7.patch")
md5sums=('c91f06711225b34b4c192c9114887b14'
         'b0fcfe52e35a61f19747a55824f2d801')

prepare() {
cd mp4v2-${pkgver}
patch -p0 -i "${srcdir}/libmp4v2-gcc7.patch"
}

build() {
export CC='gcc -m32'
export CXX='g++ -m32'
  
cd mp4v2-${pkgver}
./configure --prefix=/usr --libdir=/usr/lib32
make
}

package() {
cd mp4v2-${pkgver}
make DESTDIR="${pkgdir}" install
rm -rf "${pkgdir}"/usr/{bin,include,share}
}

