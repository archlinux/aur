# Maintainer: Alexey Galakhov <agalakhov at gmail dot com>

_origname=log4cplus
pkgname=lib32-log4cplus
pkgver=2.0.5
pkgrel=1
pkgdesc="A C++ logger very close to Java's log4j"
arch=('x86_64')
url="http://log4cplus.sourceforge.net/"
license=('GPL')
depends=('lib32-gcc-libs')
makedepends=('gcc-multilib')
source=("https://downloads.sourceforge.net/${_origname}/${_origname}-${pkgver}.tar.xz")
sha512sums=('916bd148d4f30d2dd14446faf2327ee4c8ad48c62666d5e3970a1f4b29a234f6af770164ee5db5a5a8d5a23d3fab6361abcbb49ba31b23513823dd64cb70ba46')

package() {
  cd ${srcdir}/${_origname}-${pkgver}
  make install DESTDIR=$pkgdir
  rm -rf "${pkgdir}"/{etc,usr/{bin,include,share}}
}

build() {
  cd ${srcdir}/${_origname}-${pkgver}
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix=/usr \
    --libdir='/usr/lib32' \
    --with-working-locale

  make
}
