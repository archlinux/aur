# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=phonon-qt5-mpv-git
pkgver=0.1.0.0.g069aca4
pkgrel=1
pkgdesc='Phonon MPV backend for Qt5. (GIT version)'
arch=('x86_64')
url='https://github.com/OpenProgger/phonon-mpv'
license=('GPL')
depends=(
  'gcc-libs' # 'libstdc++.so'
  'glibc' # 'libc.so'
  'mpv' 'libmpv.so'
  'phonon-qt5' # 'libphonon4qt5.so'
  'qt5-base' # 'libQt5Core.so' 'libQt5Gui.so' 'libQt5Widgets.so'
  'qt5-x11extras' # 'libQt5X11Extras.so'
)
makedepends=(
  'extra-cmake-modules'
  'git'
  'qt5-tools'
)
provides=(
  'phonon-qt5-mpv'
  'phonon-qt5-backend'
)
conflicts=('phonon-qt5-mpv')
source=('git+https://github.com/OpenProgger/phonon-mpv.git')
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd phonon-mpv
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

build() {
  cmake -S phonon-mpv -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON

  cmake --build build
}


package () {
  DESTDIR="${pkgdir}" cmake --install build
}
