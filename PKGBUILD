# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Adrià Arrufat <swiftscythe@gmail.com>
# Contributor: Mark Lee <mark@markelee.com>

pkgname=mediastreamer-git
_pkgname=mediastreamer2
pkgver=2.16.1.r333.gfb59965b
pkgrel=1
pkgdesc="A modular sound and video processing and streaming library"
arch=('x86_64')
url="https://github.com/BelledonneCommunications/mediastreamer2"
license=('GPL')
conflicts=('mediastreamer')
provides=('mediastreamer')
depends=('bctoolbox-git' 'bcg729-git' 'bcmatroska2-git' 'ffmpeg' 'glew' 'libsrtp' 'libupnp' 'libxv' 'mbedtls' 'ortp-git')
makedepends=('cmake' 'intltool')
source=("git+https://github.com/BelledonneCommunications/mediastreamer2.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/; s/-/./g' 
}

build() {
  cd ${_pkgname}
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_INSTALL_LIBDIR="/usr/lib" \
      -DENABLE_STATIC="NO" \
      -DENABLE_STRICT="NO" .
  make
}

package() {
  cd ${_pkgname}
  make DESTDIR="${pkgdir}" install
}
