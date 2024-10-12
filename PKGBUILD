# Maintainer: Alexey Galakhov <agalakhov at gmail dot com>

_origname=log4cplus
pkgname=lib32-log4cplus
pkgver=2.1.0
pkgrel=2
pkgdesc="A C++ logger very close to Java's log4j"
arch=('x86_64')
url="http://log4cplus.sourceforge.net/"
license=('GPL')
depends=('lib32-gcc-libs')
makedepends=('gcc-multilib')
source=("https://downloads.sourceforge.net/${_origname}/${_origname}-${pkgver}.tar.xz")
sha512sums=('a0dc2cad2f10042ea561075adb7adcde5aedae4e4a3bf707fba4b619961e4e4c126410e1ecc003213a07e03d2576f1825444f76a26b7964b5656efb5dfc50637')

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
