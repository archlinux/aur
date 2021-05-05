# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_pkgname=libmp4v2
pkgname=lib32-$_pkgname
pkgver=2.0.0
pkgrel=7
pkgdesc="MPEG-4 library (32 bit)"
arch=('x86_64')
url="http://code.google.com/p/mp4v2/"
license=('LGPL')
depends=("${_pkgname}" 'lib32-gcc-libs')
makedepends=('gcc-multilib')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/mp4v2/mp4v2-${pkgver}.tar.bz2"
	"libmp4v2-gcc7.patch"
	"libmp4v2-2.0.0-unsigned-int-cast.patch")
sha512sums=('15eb882f33d72d4209053b54c883b67715f539c33096705a0e7bc79015b93f6f3ac80ae29c65a0ffe9eab1bf0dedf07198bdee23fa6eafcd6ccb34f984484be0'
            'ce6430433cce19f963fbef3f61dc2630ce1ab992b077195208eb66f42ff4883e4aa3e50da8c92dd8b451c09325682ee5ce93d57410142937c74575ab31f3f6bd'
            '89cb78624096e4182056c4e9099cc13cb6251330d741ccaabe557eeb21c2df77d71367da21c16d2c33b1a7dde49429f57c7673d49be0e9a459af491a00305f37')

prepare() {
cd mp4v2-${pkgver}
patch -p0 -i "${srcdir}/libmp4v2-gcc7.patch"
patch -p1 -i "${srcdir}/libmp4v2-2.0.0-unsigned-int-cast.patch"
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

