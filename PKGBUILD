# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=lib32-slang
pkgver=2.3.3
pkgrel=1
pkgdesc='S-Lang is a powerful interpreted language'
arch=('x86_64')
url='https://www.jedsoft.org/slang/'
license=('GPL')
depends=('lib32-glibc' 'lib32-pcre' 'lib32-zlib' 'slang')
makedepends=('gcc-multilib')
options=('!makeflags')
source=("https://www.jedsoft.org/releases/slang/slang-${pkgver}.tar.bz2"{,.asc})
sha256sums=('f9145054ae131973c61208ea82486d5dd10e3c5cdad23b7c4a0617743c8f5a18'
            'SKIP')
validpgpkeys=('64083373E9E1DE997EBBE7784B82D0B82930237D')  # John E. Davis

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
