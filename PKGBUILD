# Contributor: GordonGR <ntheo1979@gmail.com>
# Maintainer: josephgbr <rafael.f.f1@gmail.com>

_pkgname=libmpcdec
pkgname=lib32-${_pkgname}
pkgver=1.2.6
pkgrel=2
pkgdesc="Musepack decoding library (32 bit)"
arch=('x86_64')
url="http://musepack.net/"
license=('custom')
depends=('lib32-glibc' "${_pkgname}")
makedepends=('gcc-multilib')
source=("http://files.musepack.net/source/${_pkgname}-${pkgver}.tar.bz2")
md5sums=('7f7a060e83b4278acf4b77d7a7b9d2c0')

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
mkdir -p "${pkgdir}/usr/share/licenses"
ln -sf ${_pkgname} "${pkgdir}/usr/share/licenses/${pkgname}"
}
