# Maintainer: Sebastian Frysztak <sebastian at frysztak dot dev>
pkgname=heatshrink
pkgver=0.4.1
pkgrel=2
pkgdesc="A data compression/decompression library for embedded/real-time systems"
url="https://github.com/atomicobject/heatshrink"
license=("ISC")
arch=('x86_64')
options+=('!lto')
makedepends=('cmake')
source=("https://github.com/atomicobject/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
'https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/heatshrink/files/heatshrink-0.4.1-cmake.patch')
sha256sums=('7529a1c8ac501191ad470b166773364e66d9926aad632690c72c63a1dea7e9a6'
'12fa7ed5bc8178c24005cab8675b6089e823e3dc542243095d9425ee06c8ccb4')

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

