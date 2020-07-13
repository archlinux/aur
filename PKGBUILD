# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: FadeMind <fademind@gmail.com>

pkgname=breeze-icons-git
pkgver=5.72.0.r1595.2c1ccab2
pkgrel=1
pkgdesc="Breeze icon themes for KDE Plasma. (GIT version)"
arch=('any')
url='https://quickgit.kde.org/?p=breeze-icons.git'
license=('LGPL')
groups=('kf5')
makedepends=('extra-cmake-modules'
             'git'
             'qt5-base'
             )
provides=('breeze-icons')
conflicts=('breeze-icons')
source=('git+https://invent.kde.org/frameworks/breeze-icons.git')
sha256sums=('SKIP')

pkgver(){
  cd breeze-icons
  _ver="$(cat CMakeLists.txt | grep -m1 '(ECM' | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../breeze-icons \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF \
    -DBINARY_ICONS_RESOURCE=ON

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
