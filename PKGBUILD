# Maintainer: David Edmundson <davidedmundson at kde dot org>

pkgname=kcgroups-git
pkgver=r22.b389c7f
pkgrel=1
pkgdesc="KDE library to manipulate cgroups (and boost foreground apps)"
arch=('i686' 'x86_64')
url="https://invent.kde.org/libraries/kcgroups.git"
license=('GPL2')
depends=('qt5-base' 'kwindowsystem' )
makedepends=('cmake' 'extra-cmake-modules' 'git')
options=()
source=("git+https://invent.kde.org/libraries/kcgroups.git")
md5sums=( 'SKIP')

pkgver() {
  cd "kcgroups"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build () {
    cd build
    cmake ../kcgroups \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Debug \
    -DAUTOSTART_FOREGROUND_BOOSTER=ON
    make
}

package() {
    cd "build"
    make DESTDIR="${pkgdir}" install
}
