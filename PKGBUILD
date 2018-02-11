# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Maribu <leonidas200@web.de>

pkgname=lib32-gdbm
pkgver=1.14.1
pkgrel=1
pkgdesc='GNU database library'
arch=('x86_64')
url='http://www.gnu.org/software/gdbm/gdbm.html'
license=('GPL')
depends=('gdbm' 'lib32-glibc')
makedepends=('gcc-multilib')
source=("ftp://ftp.gnu.org/gnu/gdbm/gdbm-${pkgver}.tar.gz")
options=('!makeflags')
sha256sums=('cdceff00ffe014495bed3aed71c7910aa88bf29379f795abc0f46d4ee5f8bc5f')

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
