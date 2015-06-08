# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kcrash-git
pkgver=r73.36b7c1f
pkgrel=1
pkgdesc='KCrash'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kcrash'
license=('LGPL')
depends=('kcoreaddons-git' 'kwindowsystem-git')
makedepends=('extra-cmake-modules-git' 'git')
groups=('kf5')
conflicts=(kcrash)
provides=(kcrash)
source=('git://anongit.kde.org/kcrash.git')
md5sums=('SKIP')

pkgver() {
  cd kcrash
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kcrash \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DLIBEXEC_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
