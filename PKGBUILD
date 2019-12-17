# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Adrià Arrufat <swiftscythe@gmail.com>
# Contributor: Mark Lee <mark@markelee.com>

pkgname=mediastreamer-git
_pkgname=mediastreamer2
pkgver=4.4.0.alpha.r2.g1119a608
pkgrel=1
pkgdesc="A modular sound and video processing and streaming library"
arch=('x86_64')
url="https://github.com/BelledonneCommunications/mediastreamer2"
license=('GPL')
conflicts=('mediastreamer')
provides=("mediastreamer=$pkgver")
depends=('bctoolbox>=4.3' 'bcg729-git' 'bcmatroska2-git' 'bzrtp>=4.3' 'ffmpeg' 'glew' 'libjpeg-turbo' 'libsrtp' 'libxv' 'mbedtls' 'ortp>=4.3' 'zxing-cpp')
makedepends=('cmake' 'doxygen' 'git')
source=("git+https://github.com/BelledonneCommunications/mediastreamer2.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/; s/-/./g' 
}

build() {
  cd ${_pkgname}
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
      -DENABLE_STATIC="NO" \
      -DENABLE_STRICT="NO" \
      -DENABLE_ZRTP="YES" \
      -DENABLE_UNIT_TESTS=NO .
  make
}

package() {
  cd ${_pkgname}
  make DESTDIR="${pkgdir}" install
}
