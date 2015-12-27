# Maintainer Lone_Wolf <lonewolf at xs4all dot nl>
# Contributor: Danibspi danibspi <at> gmail <dot> com
# Contributor: Daniel Milde <daniel@milde.cz>

pkgname=lib32-cunit
pkgver=2.1.3
pkgrel=2
pkgdesc="Lightweight system for writing, administering, and running unit tests in C"
arch=(x86_64)
url="http://cunit.sourceforge.net/"
license=('LGPL2.1')
depends=('lib32-glibc' 'cunit')
options=('!libtool')
source=('https://downloads.sourceforge.net/project/cunit/CUnit/2.1-3/CUnit-2.1-3.tar.bz2')

md5sums=('b5f1a9f6093869c070c6e4a9450cc10c')

build() {
  cd "$srcdir/CUnit-2.1-3"
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  
  autoreconf -vfi
  ./configure \
    --prefix=/usr \
    --build=i686-pc-linux-gnu \
    --host=i686-pc-linux-gnu \
    --libdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/CUnit-2.1-3"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{doc,share,include}
}



