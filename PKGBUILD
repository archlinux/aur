# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kded-git
pkgver=r54.d53b508
pkgrel=1
pkgdesc='KDE Daemon'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kded'
license=('LGPL')
depends=('kinit-git')
makedepends=('extra-cmake-modules-git' 'git' 'kdoctools-git')
groups=('kf5')
conflicts=(kded)
provides=(kded)
source=('git://anongit.kde.org/kded.git')
md5sums=('SKIP')

pkgver() {
  cd kded
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kded \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
