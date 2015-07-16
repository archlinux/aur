# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kjsembed-git
pkgver=r78.729b722
pkgrel=1
pkgdesc='Embedded JS'
arch=(i686 x86_64)
url='https://projects.kde.org/projects/frameworks/kjsembed'
license=(LGPL)
depends=(ki18n-git qt5-svg kjs-git karchive-git)
makedepends=(extra-cmake-modules-git git qt5-tools kdoctools)
groups=(kf5-aids)
conflicts=(kjsembed)
provides=(kjsembed)
source=('git://anongit.kde.org/kjsembed.git')
md5sums=('SKIP')

pkgver() {
  cd kjsembed
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kjsembed \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
