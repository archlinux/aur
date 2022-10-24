# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Fixed Torres <aur_linuxero@outlook.com>

pkgname=sayonara-player-beta
_pkgver=1.8.0-beta1
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Small, clear and fast audio player for Linux written in C++, supported by the Qt framework. It uses Gstreamer as audio backend."
arch=(i686 x86_64)
url="http://sayonara-player.com"
license=(GPL3)
depends=(qt5-base qt5-svg gst-plugins-base taglib python)
makedepends=(cmake git qt5-tools)
optdepends=('gst-libav: additional codecs'
            'gst-plugins-good: additional codecs'
            'gst-plugins-bad: additional codecs'
            'gst-plugins-ugly: additional codecs')
provides=(sayonara-player)
conflicts=(sayonara-player)
source=("git+https://gitlab.com/luciocarreras/sayonara-player.git#tag=${_pkgver}")
sha512sums=('SKIP')

prepare() {
  cd "${srcdir}/sayonara-player"
  [[ -d build ]] || mkdir build
}

build() {
  cd "${srcdir}/sayonara-player/build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DWITH_TESTS=1
  make
}

check() {
  cd "${srcdir}/sayonara-player/build"
  make test || true
}
 
package() {
  cd "${srcdir}/sayonara-player/build"
  make DESTDIR="${pkgdir}/" install
}
