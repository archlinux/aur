# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: oi_wtf <brainpower@mailbox.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Vladimir Kirillov <proger@wilab.org.ua>

pkgname=lib32-libpgm
pkgver=5.2.122
pkgrel=5
pkgdesc='An implementation of the PGM reliable multicast protocol'
arch=('x86_64')
url='https://github.com/steve-o/openpgm'
license=('LGPL2.1')
depends=('lib32-glibc' 'libpgm')
makedepends=('cmake' 'gcc-multilib' 'python2')
options=('!strip')
source=("libpgm-${pkgver}.tar.gz::https://github.com/steve-o/openpgm/archive/release-${pkgver//./-}.tar.gz")
sha256sums=('acc1545fd8060aa66b17327110e2859e451cfc685ebd3b2211619728e3471b66')

prepare() {
  cd openpgm-release-${pkgver//./-}/openpgm/pgm

  find . -type f -exec sed -i 's/python/python2/g' {} +
  autoreconf -fiv
}

build() {
  cd openpgm-release-${pkgver//./-}/openpgm/pgm \

  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32'
  make
}

package() {
  cd openpgm-release-${pkgver//./-}/openpgm/pgm \

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/{etc,usr/{bin,lib,include,share}}
}

# vim: ts=2 sw=2 et:
