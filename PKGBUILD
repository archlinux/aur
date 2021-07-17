# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Fixed Torres <aur_linuxero@outlook.com>

pkgname=sayonara-player
_pkgver=1.7.0-stable3
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Small, clear and fast audio player for Linux written in C++, supported by the Qt framework. It uses Gstreamer as audio backend."
arch=(i686 x86_64)
url="https://sayonara-player.com/"
license=(GPL3)
depends=(qt5-base taglib gst-plugins-base gst-plugins-good)
makedepends=(cmake qt5-tools qt5-svg gst-plugins-bad)
optdepends=('gst-libav: additional codecs'
            'gst-plugins-bad: additional codecs'
            'gst-plugins-ugly: additional codecs')
source=("https://sayonara-player.com/files/source/${_pkgver}/sayonara-player-${_pkgver}.tar.gz")
sha512sums=('9abdd0c41d6987738ec8001cd8d9b84f6184822958e60057488e688f06bde420f34b308ab083764b119eb96245e3bdfc627b101aa4b015ab73bdaef295c1afe6')

prepare() {
 cd "${srcdir}/${pkgname}-${_pkgver}"
  [[ -d build ]] || mkdir build
}

build() {
  cd "${srcdir}/${pkgname}-${_pkgver}/build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DWITH_TESTS=1
  make
}

check() {
  cd "${srcdir}/${pkgname}-${_pkgver}/build"
  make test
}
 
package() {
  cd "${srcdir}/${pkgname}-${_pkgver}/build"
  make DESTDIR="$pkgdir/" install
}
