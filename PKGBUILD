# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

_name=libnsl
pkgname=lib32-libnsl
pkgver=1.3.0
pkgrel=2
pkgdesc='Public client interface library for NIS(YP) and NIS+'
arch=(x86_64)
url=https://github.com/thkukuk/libnsl
license=(LGPL2.1)
depends=(
  lib32-glibc
  lib32-libtirpc
  "libnsl=${pkgver}"
)
provides=('libnsl.so')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/thkukuk/${_name}/archive/v${pkgver}.tar.gz")
sha512sums=('ce75ee9e54f1bdd2b31886e8157ff5f654511c3da017e0d9f8d0da6a2a9f9a78ff2e5f72cfb7ce3a23065f57337db51e3c8842a7e990350a62612018f4960342')
b2sums=('d5116c2837a7ed5d5916d571d2e5deaf733b2e3e4401c2ebb0ec253d2755c2dc169139ea64756bd4ab28e3107f9ff1dcdd5ef6657828862a95ca18f2f145e3b3')

prepare() {
  cd "$_name-$pkgver"
  autoreconf -fiv
}

build() {
  cd "$_name-$pkgver"

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
  cd "$_name-$pkgver"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/include
}

# vim: ts=2 sw=2 et:
