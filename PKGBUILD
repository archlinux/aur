# Contributor: jospehgbr <rafael.f.f1@gmail.com>
# Maintainer: GordonGR <ntheo1979@gmail.com>

_pkgname=fribidi
pkgname=lib32-${_pkgname}
pkgver=0.19.7
pkgrel=1
pkgdesc="A Free Implementation of the Unicode Bidirectional Algorithm (32 bit)"
arch=('x86_64')
license=('LGPL')
url="http://fribidi.org"
depends=('lib32-glib2' "${_pkgname}")
source=("http://fribidi.org/download/${_pkgname}-${pkgver}.tar.bz2")
md5sums=('6c7e7cfdd39c908f7ac619351c1c5c23')

build() {
export CC='gcc -m32'
export CXX='g++ -m32'
export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
cd ${_pkgname}-${pkgver}
./configure --prefix=/usr --libdir=/usr/lib32
make
}

package() {
make -C ${_pkgname}-${pkgver} DESTDIR="${pkgdir}" install
rm -rf "${pkgdir}"/usr/{bin,include,share}
}
