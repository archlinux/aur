# Contributor: sl1pkn07
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Manolis Tzanidakis <manolis@archlinux.org>

_pkgbase=libieee1284
pkgname=lib32-libieee1284
pkgver=0.2.11
pkgrel=5
pkgdesc="A library to query devices connected in parallel port"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://cyberelk.net/tim/libieee1284"
depends=('lib32-glibc' "${_pkgbase}=${pkgver}")
makedepends=('gcc-multilib')
source=("http://downloads.sourceforge.net/sourceforge/${_pkgbase}/${_pkgbase}-${pkgver}.tar.bz2")
sha1sums=('600e6f8a5c79b435ee81df3618cd82e2b74812de')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'  
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${_pkgbase}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --mandir=/usr/share/man \
    --without-python
  make
}

package() {
  cd "${_pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/"{include,share}
  mv "${pkgdir}/usr/bin/libieee1284_test" "${pkgdir}/usr/bin/libieee1284_test-32"
}
