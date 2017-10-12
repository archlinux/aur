# Maintainer: Daniel Milde <daniel at milde dot cz>
# Contributor: Danibspi danibspi <at> gmail <dot> com

pkgname=lib32-bcunit
pkgver=3.0.2
pkgrel=1
pkgdesc="Lightweight system for writing, administering, and running unit tests in C"
arch=(x86_64)
url="https://github.com/BelledonneCommunications/bcunit"
license=('LGPL2.1')
depends=('lib32-glibc' 'bcunit')
options=('!libtool')
source=("$pkgname-$pkgver.tar.gz::https://github.com/BelledonneCommunications/bcunit/archive/$pkgver.tar.gz")
sha256sums=('eb7090aca5006aa0cea425722cb3fa1a7139185a7d9d1734d57844f69084713f')

build() {
  cd "$srcdir/bcunit-${pkgver}"
  
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --build=i686-pc-linux-gnu \
    --host=i686-pc-linux-gnu \
    --libdir=/usr/lib32
  make
}

package() {
  cd "$srcdir/bcunit-${pkgver}"
  make DESTDIR="$pkgdir" install
  rm -rf "${pkgdir}"/usr/{doc,share,include}
}
