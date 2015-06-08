# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kemoticons-git
pkgver=r62.54fe167
pkgrel=1
pkgdesc='KEmoticons'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kemoticons'
license=('LGPL')
depends=('karchive-git' 'kservice-git')
makedepends=('extra-cmake-modules-git' 'git')
groups=('kf5')
conflicts=(kemoticons)
provides=(kemoticons)
source=('git://anongit.kde.org/kemoticons.git')
md5sums=('SKIP')

pkgver() {
  cd kemoticons
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kemoticons \
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
