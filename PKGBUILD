# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: jtts <jussaar@mbnet.fi>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Federico Quagliata <quaqo@despammed.com>

pkgname=lib32-cracklib
pkgver=2.9.4
pkgrel=1
pkgdesc='Password Checking Library'
arch=('x86_64')
url='http://sourceforge.net/projects/cracklib'
license=('GPL')
depends=('cracklib' 'lib32-zlib')
makedepends=('gcc-multilib')
source=("http://downloads.sourceforge.net/sourceforge/cracklib/cracklib-${pkgver}.tar.gz")
sha256sums=('f2a866b4b9808344228ea6d68b69e3ba9a8a99210e23dfd718d4b95c60be8958')

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
