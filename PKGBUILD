# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=yakuake-git
pkgver=v3.0.2.6.g87f7321
pkgrel=1
pkgdesc="A drop-down terminal emulator based on KDE Konsole technology. (GIT version)"
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
provides=('yakuake')
source=('git://anongit.kde.org/yakuake.git')
sha1sums=('SKIP')
install=yakuake-git.install

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
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
