# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=libzip
pkgname=lib32-${_pkgname}1
pkgver=0.9.3
pkgrel=1
pkgdesc="A C library for reading, creating, and modifying zip archives"
url="http://www.nih.at/libzip/index.html"
license=('BSD')
arch=('x86_64')
depends=('libzip1' 'lib32-zlib' 'lib32-glibc')
makedepends=('gcc-multilib')
options=('!libtool')
source=("http://www.nih.at/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  #autoreconf -i
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
  rm -r "${pkgdir}"/usr/{bin,include,share}
  rm -r "${pkgdir}"/usr/lib32/{libzip.a,libzip.so,pkgconfig}
}

sha256sums=('0e282dfed9e3da7d52223a0ccaee7c950782f10ed73f9b778243128a03c8cb1c')
