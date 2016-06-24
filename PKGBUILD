pkgname=kactivities-stats-git
pkgver=r78.4c7ecc1
pkgrel=2
pkgdesc="Core components for the KDE's Activities"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kactivities'
license=('LGPL')
depends=('kactivities-git')
provides=('kactivities-stats')
conflicts=('kactivities-stats')
makedepends=('extra-cmake-modules-git' 'git' 'boost')
source=('git://anongit.kde.org/kactivities-stats.git')
md5sums=('SKIP')

pkgver() {
  cd kactivities-stats
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kactivities-stats \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
