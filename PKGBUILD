# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: jtts <jussaar@mbnet.fi>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Federico Quagliata <quaqo@despammed.com>

pkgname=lib32-cracklib
pkgver=2.9.11
pkgrel=1
pkgdesc='Password Checking Library'
arch=(x86_64)
url=https://github.com/cracklib/cracklib
license=(GPL)
depends=(
  cracklib
  lib32-zlib
)
makedepends=(git)
source=(git+https://github.com/cracklib/cracklib.git#tag=v${pkgver})
sha256sums=(SKIP)

prepare() {
  cd cracklib/src

  ./autogen.sh
}

build() {
  cd cracklib/src

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --sbindir=/usr/bin \
    --without-python
  make
}

package() {
  make DESTDIR="${pkgdir}" -C cracklib/src install
  rm -rf "${pkgdir}"/usr/{include,bin,share}
}

# vim: ts=2 sw=2 et:
