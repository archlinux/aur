# Maintainer: Alexey Galakhov <agalakhov at gmail dot com>

_origname=log4cplus
pkgname=lib32-log4cplus
_origver=1.2.0-rc2
pkgver=1.2.0rc2
pkgrel=1
pkgdesc="A C++ logger very close to Java's log4j"
arch=('x86_64')
url="http://log4cplus.sourceforge.net/"
license=('GPL')
depends=('lib32-gcc-libs')
source=("http://downloads.sourceforge.net/${_origname}/${_origname}-${_origver}.tar.xz")
sha256sums=('b4cebe31af5c6dffcf511e17e8838c6f537bb673b3d0264d37c0514baf43189d')

package() {
  cd ${srcdir}/${_origname}-${_origver}

  make install DESTDIR=$pkgdir
  rm -rf "${pkgdir}"/{etc,usr/{bin,include,share}}
}

build() {
  cd ${srcdir}/${_origname}-${_origver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix=/usr \
    --libdir='/usr/lib32' \
    --with-working-locale

  make
}
