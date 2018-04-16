# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=lib32-libnsl
pkgver=1.2.0
pkgrel=1
pkgdesc='Public client interface library for NIS(YP) and NIS+'
arch=('x86_64')
url='https://github.com/thkukuk/libnsl'
license=('LGPL2.1')
depends=('lib32-libtirpc' 'libnsl')
makedepends=('gcc-multilib')
source=("libnsl-${pkgver}.tar.gz::https://github.com/thkukuk/libnsl/archive/v${pkgver}.tar.gz")
sha256sums=('a5a28ef17c4ca23a005a729257c959620b09f8c7f99d0edbfe2eb6b06bafd3f8')

prepare() {
  cd libnsl-${pkgver}

  ./autogen.sh
}

build() {
  cd libnsl-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkg-config'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --disable-static
  make
}

package() {
  cd libnsl-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/include
}

# vim: ts=2 sw=2 et:
