# Maintainer: Daniel Milde <daniel at milde dot cz>
# Contributor: Danibspi danibspi <at> gmail <dot> com

pkgname=lib32-bcunit
pkgver=3.0
_commit=29c556fa8ac1ab21fba1291231ffa8dea43cf32a
pkgrel=2
pkgdesc="Lightweight system for writing, administering, and running unit tests in C"
arch=(x86_64)
url="https://github.com/BelledonneCommunications/bcunit"
license=('LGPL2.1')
depends=(lib32-glibc)
options=('!libtool')
#source=("$pkgname-$pkgver.tar.gz::https://github.com/BelledonneCommunications/bcunit/archive/$pkgver.tar.gz")
source=("bcunit-$pkgver.tar.gz::https://github.com/BelledonneCommunications/bcunit/archive/${_commit}.zip")
sha256sums=('e255f062249b75bfeb6a1c02943b602709f1f10738144075b036b3231aa4d590')

build() {
  cd "$srcdir/bcunit-${_commit}"
  
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
  cd "$srcdir/bcunit-${_commit}"
  make DESTDIR="$pkgdir" install
  rm -rf "${pkgdir}"/usr/{doc,share,include}
}
