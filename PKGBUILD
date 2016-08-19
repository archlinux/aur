# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=lib32-slang
pkgver=2.3.0
pkgrel=1
pkgdesc='S-Lang is a powerful interpreted language'
arch=('x86_64')
url='http://www.jedsoft.org/slang/'
license=('GPL')
depends=('lib32-glibc' 'lib32-pcre' 'lib32-zlib' 'slang')
makedepends=('gcc-multilib')
options=('!makeflags')
source=("http://www.jedsoft.org/releases/slang/slang-${pkgver}.tar.bz2"{,.asc})
sha256sums=('f95224060f45e0d8212a5039b339afa5f1a94a1bb0298e796104e5b12e926129'
            'SKIP')
validpgpkeys=('AE962A02D29BFE4A4BB2805FDE401E0D5873000A') # John E. Davis

build() {
  cd slang-${pkgver}

  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --sysconfdir='/etc' \
    --without-onig \
    --without-png
  make
}

package() {
  cd slang-${pkgver}

  make DESTDIR="${pkgdir}" install-all
  rm -rf "${pkgdir}"/{etc,usr/{bin,include,share}}
}

# vim: ts=2 sw=2 et:
