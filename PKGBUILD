# Maintainer: Alexey Galakhov <agalakhov at gmail dot com>

_origname=log4cplus
pkgname=lib32-log4cplus
_origver=1.2.0
pkgver=1.2.0
pkgrel=1
pkgdesc="A C++ logger very close to Java's log4j"
arch=('x86_64')
url="http://log4cplus.sourceforge.net/"
license=('GPL')
depends=('lib32-gcc-libs')
makedepends=('gcc-multilib')
source=("http://downloads.sourceforge.net/${_origname}/${_origname}-${_origver}.tar.xz")
sha256sums=('93aa5b26425f0b1596c5e5b3d58916988fdd83b359a02ca59878eb5c7c2ec6c2')

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
