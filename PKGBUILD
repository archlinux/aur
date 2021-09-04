# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Maxime Gauduin <alucryd at archlinux dot org>
# Contributor: josephgbr <rafael dot f dot f1 at gmail dot com>
# Contributor: Maribu <leonidas200 at web dot de>
# Maintainer: Hurricane Pootis <hurricanepootis@protonmail.com>

pkgname=lib32-gdbm
pkgver=1.21
pkgrel=1
pkgdesc='GNU database library (32-bit)'
arch=('x86_64')
url='http://www.gnu.org/software/gdbm/gdbm.html'
license=('GPL3')
depends=('gdbm' 'lib32-glibc')
makedepends=('gcc-multilib' 'lib32-gcc-libs')
source=("ftp://ftp.gnu.org/gnu/gdbm/gdbm-${pkgver}.tar.gz")
#options=('!makeflags')
sha512sums=('b2a31802d1af9f97b24d3dd01cb048bab4a8e748297f1b70851c0342400dde4281242b7f80bd92a36035e22398d240d131b550ab444ee838a077522a6921fa43')


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
