# Maintainer: Sebastian Frysztak <sebastian at frysztak dot dev>
pkgname=heatshrink
pkgver=0.4.1
pkgrel=1
pkgdesc="A data compression/decompression library for embedded/real-time systems"
url="https://github.com/atomicobject/heatshrink"
license=("ISC")
arch=('x86_64')
source=("https://github.com/atomicobject/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
'https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/heatshrink/files/heatshrink-0.4.1-cmake.patch')
sha256sums=('SKIP' 'SKIP')

build() {
  cd "${pkgname}-${pkgver}"
  patch -p1 < ../heatshrink-0.4.1-cmake.patch

  cmake \
    -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev

  cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install "${pkgname}-${pkgver}/build"
}


# vim:set ts=2 sw=2 et:

