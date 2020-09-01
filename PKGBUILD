# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=lib32-libnsl
pkgver=1.3.0
pkgrel=1
pkgdesc='Public client interface library for NIS(YP) and NIS+'
arch=(x86_64)
url=https://github.com/thkukuk/libnsl
license=(LGPL2.1)
depends=(
  lib32-libtirpc
  libnsl
)
makedepends=(git)
_tag=fbad7b36acaa89a54023930af70805649f962999
source=(git+https://github.com/thkukuk/libnsl.git#tag=${_tag})
sha256sums=(SKIP)

pkgver() {
  cd libnsl

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd libnsl

  autoreconf -fiv
}

build() {
  cd libnsl

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkg-config'

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --disable-static
  make
}

package() {
  make DESTDIR="${pkgdir}" -C libnsl install
  rm -rf "${pkgdir}"/usr/include
}

# vim: ts=2 sw=2 et:
