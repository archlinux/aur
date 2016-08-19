# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: oi_wtf <brainpower@mailbox.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Vladimir Kirillov <proger@wilab.org.ua>

pkgname=lib32-libpgm
pkgver=5.2.122
pkgrel=2
pkgdesc='An implementation of the PGM reliable multicast protocol'
arch=('i686' 'x86_64')
url='http://code.google.com/p/openpgm'
license=('LGPL2.1')
depends=('lib32-glibc' 'libpgm')
makedepends=('python2')
options=('!strip')
source=("http://openpgm.googlecode.com/files/libpgm-$pkgver.tar.gz")
sha256sums=('6b895f550b95284dcde7189b01e04a9a1c1f94579af31b1eebd32c2207a1ba2c')

prepare() {
  cd libpgm-${pkgver}/openpgm/pgm

  find . -type f -exec sed -i 's/python/python2/g' {} +
}

build() {
  cd libpgm-${pkgver}/openpgm/pgm

  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' --libdir='/usr/lib32'
  make
}

package() {
  cd libpgm-${pkgver}/openpgm/pgm

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/{etc,usr/{bin,lib,include,share}}
}

# vim: ts=2 sw=2 et:
