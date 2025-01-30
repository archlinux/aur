# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: jtts <jussaar@mbnet.fi>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Federico Quagliata <quaqo@despammed.com>

pkgname=lib32-cracklib
pkgver=2.10.3
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
sha256sums=('f776f244d44f16c21212784cb8b939e5bc97b5d2afccab82530494a53dccd9d0')

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
