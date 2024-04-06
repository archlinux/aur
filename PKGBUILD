# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=phonon-qt5-mpv-git
pkgname=(
  'phonon-qt5-mpv-git'
  'phonon-qt6-mpv-git'
)
pkgver=0.1.0.0.g069aca4
pkgrel=1
pkgdesc='Phonon MPV backend for Qt5 and Qt6 (GIT version)'
arch=('x86_64')
url='https://github.com/OpenProgger/phonon-mpv'
license=('GPL')
depends=(
  'gcc-libs' # 'libstdc++.so'
  'glibc' # 'libc.so'
  'mpv' 'libmpv.so'
)
makedepends=(
  'extra-cmake-modules'
  'git'
  'qt5-tools'
  'qt6-tools'
  'phonon-qt6' # libphonon4qt6.so
  'qt6-base' # libQt6Core.so libQt6Gui.so libQt6OpenGLWidgets.so libQt6Widgets.so
  'phonon-qt5' # 'libphonon4qt5.so'
  'qt5-base' # 'libQt5Core.so' 'libQt5Gui.so' 'libQt5Widgets.so'
  'qt5-x11extras' # 'libQt5X11Extras.so'
)
source=('git+https://github.com/OpenProgger/phonon-mpv.git')
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd phonon-mpv
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

build() {
  cmake -S phonon-mpv -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -DPHONON_BUILD_QT5=ON \
    -DPHONON_BUILD_QT6=ON

  cmake --build build
}


package_phonon-qt5-mpv-git () {
  pkgdesc='Phonon MPV backend for Qt5 (GIT version)'
  depends+=(
    'phonon-qt5' # 'libphonon4qt5.so'
    'qt5-base' # 'libQt5Core.so' 'libQt5Gui.so' 'libQt5Widgets.so'
    'qt5-x11extras' # 'libQt5X11Extras.so'
  )
  provides=(
    'phonon-qt5-mpv'
    'phonon-qt5-backend'
  )
  conflicts=('phonon-qt5-mpv')

  DESTDIR="${pkgdir}" cmake --install build/src5
}

package_phonon-qt6-mpv-git () {
  pkgdesc='Phonon MPV backend for Qt6 (GIT version)'
  depends+=(
    'phonon-qt6' # libphonon4qt6.so
    'qt6-base' # libQt6Core.so libQt6Gui.so libQt6OpenGLWidgets.so libQt6Widgets.so
  )
  provides=(
    'phonon-qt6-mpv'
    'phonon-qt6-backend'
  )
  conflicts=('phonon-qt6-mpv')

  DESTDIR="${pkgdir}" cmake --install build/src6
}

