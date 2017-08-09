# Maintainer: Kris McCleary <kris27mc@gmail.com>

_pkgname=libzip
pkgname=lib32-${_pkgname}
pkgver=1.2.0
pkgrel=1
pkgdesc="A C library for reading, creating, and modifying zip archives"
url="http://www.nih.at/libzip/index.html"
license=('BSD')
arch=('x86_64')
depends=('lib32-zlib' 'lib32-glibc')
makedepends=('gcc-multilib')
options=('!libtool')
source=("http://www.nih.at/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('6cf9840e427db96ebf3936665430bab204c9ebbd0120c326459077ed9c907d9f')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  #autoreconf -i
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  ./configure --build=i386-pc-linux-gnu CFLAGS="-m32 -DNDEBUG" CXXFLAGS="-m32 -DNDEBUG" LDFLAGS=-m32 --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
  rm -r "${pkgdir}"/usr/{bin,include,share}
}
