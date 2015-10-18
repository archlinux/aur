# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=yakuake-frameworks-git
pkgver=v2.9.9.97.g4b5445f
pkgrel=1
pkgdesc="A drop-down terminal emulator based on KDE Konsole technology. KF5 Frameworks branch. (GIT version)"
arch=('i686' 'x86_64')
url='https://www.kde.org/applications/system/yakuake'
license=('GPL')
depends=('knewstuff'
         'konsole'
         'hicolor-icon-theme'
         )
makedepends=('extra-cmake-modules'
             'git'
             'python'
             )
conflicts=('yakuake')
source=('git://anongit.kde.org/yakuake.git#branch=frameworks')
sha1sums=('SKIP')
install=yakuake-frameworks-git.install

pkgver() {
  cd yakuake
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../yakuake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
