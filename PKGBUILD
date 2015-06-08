# Contributor: jospehgbr <rafael.f.f1@gmail.com>
# Maintainer: GordonGR <ntheo1979@gmail.com>

_pkgname=fribidi
pkgname=lib32-${_pkgname}
pkgver=0.19.6
pkgrel=2
pkgdesc="A Free Implementation of the Unicode Bidirectional Algorithm (32 bit)"
arch=('x86_64')
license=('LGPL')
url="http://fribidi.org"
depends=('lib32-glib2' "${_pkgname}")
source=("http://fribidi.org/download/${_pkgname}-${pkgver}.tar.bz2")
md5sums=('ce93d862344991173dabb609bf93ca1d')

build() {
export CC='gcc -m32'
export CXX='g++ -m32'
export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
cd ${_pkgname}-${pkgver}
./configure --prefix=/usr --libdir=/usr/lib32 \
  --enable-malloc # FS#42017
make
}

package() {
make -C ${_pkgname}-${pkgver} DESTDIR="${pkgdir}" install
rm -rf "${pkgdir}"/usr/{bin,include,share}
}
