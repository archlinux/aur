# Maintainer: Maxime Gauduin <alucryd@gmail.com>

pkgname=lib32-cdparanoia
pkgver=10.2
pkgrel=2
pkgdesc='Compact Disc Digital Audio extraction tool'
arch=('x86_64')
url='http://www.xiph.org/paranoia/'
license=('GPL')
depends=('cdparanoia' 'lib32-glibc')
makedepends=('gcc-multilib')
options=('!makeflags')
source=("http://downloads.xiph.org/releases/cdparanoia/cdparanoia-III-${pkgver}.src.tgz"
        'gcc.patch')
sha256sums=('005db45ef4ee017f5c32ec124f913a0546e77014266c6a1c50df902a55fe64df'
            '9a3f3802856e96080fb30562a10899ef3378723e85f289fa29619b21d6051575')

prepare() {
  cd cdparanoia-III-${pkgver}

  patch -Np0 -i ../gcc.patch
}

build() {
  cd cdparanoia-III-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  autoreconf
  ./configure \
    --prefix="${pkgdir}/usr" \
    --libdir="${pkgdir}/usr/lib32"
  make
}

package() {
  cd cdparanoia-III-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}

# vim: ts=2 sw=2 et:
