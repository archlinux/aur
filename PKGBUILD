# Maintainer: Alexey Galakhov <agalakhov at gmail dot com>

_origname=log4cplus
pkgname=lib32-log4cplus
_origver=1.2.0-rc5
pkgver=1.2.0rc5
pkgrel=1
pkgdesc="A C++ logger very close to Java's log4j"
arch=('x86_64')
url="http://log4cplus.sourceforge.net/"
license=('GPL')
depends=('lib32-gcc-libs')
source=("http://downloads.sourceforge.net/${_origname}/${_origname}-${_origver}.tar.xz")
sha256sums=('224d149691fc75ae36875855be3f487d7de301a04d7b5bd2929ef7c35a91d256')

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
