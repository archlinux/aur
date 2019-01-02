pkgname=kdiagram-git
pkgver=2.6.1.r21.g47b29c2
pkgrel=1
pkgdesc="Powerful libraries (KChart, KGantt) for creating business diagrams. (GIT version)"
arch=('i686' 'x86_64')
url='http://quickgit.kde.org/?p=kdiagram.git'
license=('LGPL')
depends=('qt5-svg')
makedepends=('git'
             'extra-cmake-modules'
             )
conflicts=('kdiagram')
provides=('kdiagram')
source=("git://anongit.kde.org/kdiagram.git")
sha256sums=('SKIP')

pkgver() {
  cd kdiagram
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kdiagram \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release \
      -DKDE_INSTALL_LIBDIR=lib \
      -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
