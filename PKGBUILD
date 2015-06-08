# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=ki18n-git
pkgver=r80.8848a56
pkgrel=1
pkgdesc='Ki18n'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/ki18n'
license=('LGPL')
depends=('qt5-script')
makedepends=('extra-cmake-modules-git' 'git' 'python')
groups=('kf5')
conflicts=(ki18n)
provides=(ki18n)
source=('git://anongit.kde.org/ki18n.git')
md5sums=('SKIP')

pkgver() {
  cd ki18n
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../ki18n \
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
