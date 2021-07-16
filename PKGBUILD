# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Maxime Gauduin <alucryd at archlinux dot org>
# Contributor: josephgbr <rafael dot f dot f1 at gmail dot com>
# Contributor: Maribu <leonidas200 at web dot de>
# Maintainer: Hurricane Pootis <hurricanepootis@protonmail.com>

pkgname=lib32-gdbm
pkgver=1.20
pkgrel=1
pkgdesc='GNU database library (32-bit)'
arch=('x86_64')
url='http://www.gnu.org/software/gdbm/gdbm.html'
license=('GPL3')
depends=('gdbm' 'lib32-glibc')
makedepends=('gcc-multilib' 'lib32-gcc-libs')
source=("ftp://ftp.gnu.org/gnu/gdbm/gdbm-${pkgver}.tar.gz")
#options=('!makeflags')
sha256sums=('3aeac05648b3482a10a2da986b9f3a380a29ad650be80b9817a435fb8114a292')

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
