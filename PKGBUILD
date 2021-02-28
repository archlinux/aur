# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Fixed Torres <aur_linuxero@outlook.com>

pkgname=sayonara-player-beta
_pkgver=1.6.0-beta7
pkgver=${_pkgver//-/_}
pkgrel=2
pkgdesc="Small, clear and fast audio player for Linux written in C++, supported by the Qt framework. It uses Gstreamer as audio backend."
arch=(i686 x86_64)
url="http://sayonara-player.com"
license=(GPL3)
depends=(qt5-base taglib gst-plugins-base gst-plugins-good)
makedepends=(cmake qt5-tools qt5-svg git gst-plugins-bad)
optdepends=('gst-libav: additional codecs'
            'gst-plugins-bad: additional codecs'
            'gst-plugins-ugly: additional codecs')
provides=(sayonara-player)
conflicts=(sayonara-player)
source=("https://gitlab.com/luciocarreras/sayonara-player/-/archive/${_pkgver}/sayonara-player-${_pkgver}.tar.gz")
sha512sums=('d715eaea34a9b0bf7144b5c095c40980ebadb77a00cac065f97cd74a877140849ff74ce323e01eba83a9465d57f0d35129bc64984964abc224c33fa7738fd121')

prepare() {
  cd "$srcdir/sayonara-player-${_pkgver}"
  [[ -d build ]] || mkdir build
}

build() {
  cd "$srcdir/sayonara-player-${_pkgver}/build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DUSE_SYSTEM_TAGLIB=1 \
    -DWITH_TESTS=1
  make
}

check() {
  cd "$srcdir/sayonara-player-${_pkgver}/build"
  make test
}
 
package() {
  cd "$srcdir/sayonara-player-${_pkgver}/build"
  make DESTDIR="$pkgdir/" install
}
