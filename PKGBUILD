# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgbase=phonon-mpv
pkgname=(phonon-qt5-mpv
         phonon-qt6-mpv)
pkgver=0.1.0
pkgrel=3
pkgdesc="Phonon MPV backend"
arch=(x86_64)
url="https://github.com/OpenProgger/phonon-mpv"
license=(LGPL-2.1-only)
depends=(gcc-libs
         glibc
         mpv)
makedepends=(extra-cmake-modules
             git
             phonon-qt5
             phonon-qt6)
source=(git+$url.git#tag=v$pkgver)
sha256sums=('ad6de80c786cd71f7dca36701e482ad6ca9326653aa0315e8d1b766ccb316636')

build() {
  cmake -B build5 -S phonon-mpv
  cmake --build build5

  cmake -B build6 -S phonon-mpv \
    -DPHONON_BUILD_QT5=OFF \
    -DPHONON_BUILD_QT6=ON
  cmake --build build6
}

package_phonon-qt5-mpv() {
  pkgdesc+=' for Qt5'
  depends+=(phonon-qt5
            qt5-base
            qt5-x11extras)
  provides=(phonon-qt5-backend)

  DESTDIR="$pkgdir" cmake --install build5
}

package_phonon-qt6-mpv() {
  pkgdesc+=' for Qt6'
  depends+=(phonon-qt6
            qt6-base)
  provides=(phonon-qt6-backend)

  DESTDIR="$pkgdir" cmake --install build6
}
