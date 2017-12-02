# $Id$
# Maintainer:
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Adrià Arrufat <swiftscythe@gmail.com>
# Contributor: Mark Lee <mark@markelee.com>

pkgname=mediastreamer-git
_pkgname=mediastreamer2
pkgver=2.16.1.r100.g927dda74
pkgrel=1
pkgdesc="A library written in C that allows you to create and run audio and video streams"
arch=('i686' 'x86_64')
url="https://github.com/BelledonneCommunications/mediastreamer2"
license=('GPL')
conflicts=('mediastreamer')
provides=('mediastreamer')
depends=('ortp-git' 'ffmpeg' 'libxv' 'libupnp' 'bzrtp-git' 'glew' 'libsrtp' 'mbedtls' 'bctoolbox-git')
# xxd from Vim is needed to build
makedepends=('cmake' 'intltool')
source=("git+https://github.com/BelledonneCommunications/mediastreamer2.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/; s/-/./g' 
}

build() {
  cd ${_pkgname}
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_INSTALL_LIBDIR="/usr/lib" \
      -DENABLE_STATIC="NO" .
  make
}

package() {
  cd ${_pkgname}
  make DESTDIR="${pkgdir}" install
}
