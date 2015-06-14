# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=ktimer-git
pkgver=r264.a3d42f7
pkgrel=1
pkgdesc="A little tool to execute programs after some time. (GIT version)"
url='https://www.kde.org/applications/utilities/ktimer'
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('kio' 'hicolor-icon-theme')
makedepends=('extra-cmake-modules' 'kdoctools' 'git' 'python')
conflicts=('kdeutils-ktimer' 'ktimer')
provides=('ktimer')
source=("git://anongit.kde.org/ktimer.git")
sha1sums=('SKIP')
install=ktimer-git.install

pkgver() {
  cd ktimer
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../ktimer \
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
