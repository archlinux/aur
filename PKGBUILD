# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Fixed Torres <aur_linuxero@outlook.com>

pkgname=sayonara-player
_pkgver=1.7.0-stable1
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Small, clear and fast audio player for Linux written in C++, supported by the Qt framework. It uses Gstreamer as audio backend."
arch=(i686 x86_64)
url="http://sayonara-player.com"
license=(GPL3)
depends=(qt5-base taglib gst-plugins-base gst-plugins-good)
makedepends=(cmake qt5-tools qt5-svg gst-plugins-bad)
optdepends=('gst-libav: additional codecs'
            'gst-plugins-bad: additional codecs'
            'gst-plugins-ugly: additional codecs')
source=("https://sayonara-player.com/files/sayonara-player-${_pkgver}.tar.gz")
sha512sums=('b9e09770fb6a4dd2ee9ef2691f844e07cd4ed82467c1a70858538a2af1173308ec45481fc7bc48ba7d0183079befb603a44f352ee7e71073bb16f2e62dcb2177')

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
