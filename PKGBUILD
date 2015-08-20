pkgname=kdiagram-git
pkgver=0.76.d4f94e0
pkgrel=1
pkgdesc="Powerful libraries (KChart, KGantt) for creating business diagrams. (GIT version)"
arch=('i686' 'x86_64')
url='http://quickgit.kde.org/?p=kdiagram.git'
license=('LGPL')
depends=('qt5-svg')
makedepends=('git' 'extra-cmake-modules')
conflicts=('kdiagram')
provides=('kdiagram')
source=("git://anongit.kde.org/kdiagram.git")
sha256sums=('SKIP')

pkgver() {
  cd kdiagram
  echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kdiagram \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release \
      -DLIB_INSTALL_DIR=lib \
      -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
      -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
