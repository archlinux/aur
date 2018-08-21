# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Maribu <leonidas200@web.de>

pkgname=lib32-gdbm
pkgver=1.18
pkgrel=1
pkgdesc='GNU database library'
arch=('x86_64')
url='http://www.gnu.org/software/gdbm/gdbm.html'
license=('GPL')
depends=('gdbm' 'lib32-gcc-libs' 'lib32-glibc')
makedepends=('gcc-multilib')
source=("ftp://ftp.gnu.org/gnu/gdbm/gdbm-${pkgver}.tar.gz")
options=('!makeflags')
sha256sums=('b8822cb4769e2d759c828c06f196614936c88c141c3132b18252fe25c2b635ce')

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

# vim: ts=2 sw=2 et:
