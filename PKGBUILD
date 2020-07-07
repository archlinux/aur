# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Llewelyn Trahaearn <woefulderelict@gmail.com>
# Contributor: TheWaffleGuy <gvxq@hotmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=libgcrypt15
pkgver=1.5.6
pkgrel=3
pkgdesc='General purpose cryptographic library based on the code from GnuPG'
arch=('x86_64')
url='http://www.gnupg.org'
license=('LGPL')
depends=('glibc' 'libgpg-error')
replaces=('libgcrypt11')
source=("https://www.gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-${pkgver}.tar.bz2"{,.sig})
sha256sums=('301826b5e521c867056fd630aad6f0a60e176d18a017da6bc24b1695df3abe79'
            'SKIP')
validpgpkeys=('D8692123C4065DEA5E0F3AB5249B39D24F25E3B6') # Werner Koch

build() {
  cd libgcrypt-${pkgver}

  ./configure \
    --prefix='/usr' \
    --disable-static \
    --disable-padlock-support
  make
}

package() {
  cd libgcrypt-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,lib/libgcrypt.so,share}
}

# vim: ts=2 sw=2 et:
