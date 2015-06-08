# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kinit-git
pkgver=r101.b2009bf
pkgrel=1
pkgdesc='KInit'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kinit'
license=('LGPL')
depends=('kio-git')
makedepends=('extra-cmake-modules-git' 'git' 'kdoctools-git')
groups=('kf5')
conflicts=(kinit)
provides=(kinit)
source=('git://anongit.kde.org/kinit.git')
md5sums=('SKIP')

pkgver() {
  cd kinit
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kinit \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DLIBEXEC_INSTALL_DIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
