# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Maxime Gauduin <alucryd at archlinux dot org>
# Contributor: josephgbr <rafael dot f dot f1 at gmail dot com>
# Contributor: Maribu <leonidas200 at web dot de>
# Maintainer: Hurricane Pootis <hurricanepootis@protonmail.com>

pkgname=lib32-gdbm
pkgver=1.23
pkgrel=1
pkgdesc='GNU database library (32-bit)'
arch=('x86_64' 'i686')
url='http://www.gnu.org/software/gdbm/gdbm.html'
license=('GPL3')
depends=('gdbm' 'lib32-glibc')
makedepends=('gcc-multilib' 'lib32-gcc-libs')
source=("ftp://ftp.gnu.org/gnu/gdbm/gdbm-${pkgver}.tar.gz")
#options=('!makeflags')
sha512sums=('918080cb0225b221c11eb7339634a95e00c526072395f7a3d46ccf42ef020dea7c4c5bec34aff2c4f16033e1fff6583252b7e978f68b8d7f8736b0e025838e10')


build() {
  cd gdbm-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --enable-libgdbm-compat
  make
}

package() {
  cd gdbm-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,share,include}
}
