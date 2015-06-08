# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_pkgname=libmms
pkgname=lib32-${_pkgname}
pkgver=0.6.4
pkgrel=1
pkgdesc="MMS stream protocol library (32 bit)"
arch=('x86_64')
url="http://sourceforge.net/projects/libmms/"
license=(LGPL)
depends=('lib32-glibc' "$_pkgname")
makedepends=('gcc-multilib')
source=(http://download.sourceforge.net/libmms/${_pkgname}-${pkgver}.tar.gz)
md5sums=('d6b665b335a6360e000976e770da7691')

build() {
export CC='gcc -m32'
export CXX='g++ -m32'
export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
cd "${srcdir}/${_pkgname}-${pkgver}"
./configure --prefix=/usr --disable-static --libdir=/usr/lib32
make
}

package() {
cd "${srcdir}/${_pkgname}-${pkgver}"
make DESTDIR="${pkgdir}" install
rm -rf "${pkgdir}/usr/include"
}
