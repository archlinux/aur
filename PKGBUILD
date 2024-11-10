# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Maxime Gauduin <alucryd at archlinux dot org>
# Contributor: josephgbr <rafael dot f dot f1 at gmail dot com>
# Contributor: Maribu <leonidas200 at web dot de>
# Maintainer: Hurricane Pootis <hurricanepootis@protonmail.com>

pkgname=lib32-gdbm
pkgver=1.24
pkgrel=1
pkgdesc='GNU database library (32-bit)'
arch=('x86_64' 'i686')
url='http://www.gnu.org/software/gdbm/gdbm.html'
license=('GPL-3.0-or-later')
depends=('gdbm' 'lib32-glibc')
makedepends=('gcc-multilib' 'lib32-gcc-libs')
source=("ftp://ftp.gnu.org/gnu/gdbm/gdbm-${pkgver}.tar.gz")
#options=('!makeflags')
sha512sums=('401ff8c707079f21da1ac1d6f4714a87f224b6f41943078487dc891be49f51fd1ac7a32fd599aae0fad185f2c6ba7432616d328fd6aaab068eb54db9562ff7fa')


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
