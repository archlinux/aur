# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: TheWaffleGuy <gvxq@hotmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=lib32-libgcrypt15
pkgver=1.5.3
pkgrel=2
pkgdesc='General purpose cryptographic library based on the code from GnuPG'
arch=('x86_64')
url='http://www.gnupg.org'
license=('LGPL')
depends=('lib32-libgpg-error')
makedepends=('gcc-multilib' 'libtool-multilib')
source=("ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-${pkgver}.tar.bz2")
sha256sums=('bcf5334e7da352c45de6aec5d2084ce9a1d30029ff4a4a5da13f1848874759d1')

prepare() {
  cd libgcrypt-${pkgver}

  sed 's:path="amd64":path="i586 i386":' -i mpi/config.links
}

build() {
  cd libgcrypt-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --enable-shared \
    --disable-padlock-support \
    --disable-static
  make
}

package() {
  cd libgcrypt-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,lib32/libgcrypt.so,share}
}

# vim: ts=2 sw=2 et:
