# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: jtts <jussaar@mbnet.fi>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Federico Quagliata <quaqo@despammed.com>

pkgname=lib32-cracklib
pkgver=2.9.6
pkgrel=1
pkgdesc='Password Checking Library'
arch=('x86_64')
url='https://github.com/cracklib/cracklib'
license=('GPL')
depends=('cracklib' 'lib32-zlib')
makedepends=('gcc-multilib')
source=("https://github.com/cracklib/cracklib/releases/download/cracklib-${pkgver}/cracklib-${pkgver}.tar.gz")
sha256sums=('17cf76943de272fd579ed831a1fd85339b393f8d00bf9e0d17c91e972f583343')

build() {
  cd cracklib-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --sbindir='/usr/bin' \
    --without-python
  make
}

package() {
  cd cracklib-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,bin,share}
}

# vim: ts=2 sw=2 et:
