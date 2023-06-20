# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Adrià Arrufat <swiftscythe@gmail.com>
# Contributor: Mark Lee <mark@markelee.com>

pkgname=mediastreamer-git
_pkgname=mediastreamer2
pkgver=5.3.0.alpha.r64.g62a23baa
pkgrel=1
pkgdesc="A modular sound and video processing and streaming library"
arch=('x86_64')
url="https://github.com/BelledonneCommunications/mediastreamer2"
license=('GPL')
conflicts=('mediastreamer')
provides=("mediastreamer=$pkgver")
depends=('bcg729-git' 'bcmatroska2-git' 'bzrtp>=4.4' 'ffmpeg' 'glew' 'libsrtp' 'mbedtls' 'ortp>=4.4.0' 'zxing-cpp')
makedepends=('cmake' 'doxygen' 'git')
source=("git+https://github.com/BelledonneCommunications/mediastreamer2.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/; s/-/./g' 
}

build() {
  cmake -B build -S $_pkgname \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DENABLE_STATIC="NO" \
      -DENABLE_STRICT="NO" \
      -DENABLE_ZRTP="YES" \
      -DENABLE_UNIT_TESTS=NO
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
