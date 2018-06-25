# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_pkgname=libdca
pkgname=lib32-${_pkgname}
pkgver=0.0.6
pkgrel=1
pkgdesc="Free library for decoding DTS Coherent Acoustics streams (32 bit)"
arch=('x86_64')
license=('GPL')
url="http://www.videolan.org/developers/libdca.html"
depends=('lib32-glibc' "${_pkgname}")
makedepends=('gcc-multilib')
options=('!emptydirs')
source=("https://download.videolan.org/pub/videolan/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}.tar.bz2")
sha512sums=('d264128019e7fd295a35691636311f81960c17802dbbc67764c4e00b2fdf12ebc69b057a4947b57551a130e5cfd1fef3fe3558c7067216ea04a0b6bbb881b4f1')

build() {
export CC='gcc -m32'
export CXX='g++ -m32'
export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
cd ${_pkgname}-${pkgver}
./configure --prefix=/usr --mandir=/usr/share/man --libdir=/usr/lib32 --disable-static
make
}

package() {
cd ${_pkgname}-${pkgver}
make DESTDIR="${pkgdir}" install
rm -rf "${pkgdir}/usr"/{bin,include,share}
rm "${pkgdir}/usr/lib32/libdts.a"
}
