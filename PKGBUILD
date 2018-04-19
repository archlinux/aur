# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=lib32-mpdecimal
_pkgbasename=mpdecimal
pkgver=2.4.2
pkgrel=1
pkgdesc="Package for correctly-rounded arbitrary precision decimal floating point arithmetic"
arch=('x86_64')
url="http://www.bytereef.org/mpdecimal/index.html"
license=('custom')
depends=('lib32-glibc' 'lib32-gcc-libs' 'mpdecimal')
source=("http://www.bytereef.org/software/${_pkgbasename}/releases/${_pkgbasename}-${pkgver}.tar.gz")
sha512sums=('eb18ad53b81b93c469db4d915bbb3fae21b36ad82a88e01fef3a6946ac5f50b54376e259a5ecbe23836f1efd59d226b942ecdee87eaba7f9e75cdcaaa9499ef7')

prepare() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  autoreconf -fiv
}

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export LDFLAGS+=' -m32'
 
 ./configure \
   --prefix=/usr \
   --libdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}
