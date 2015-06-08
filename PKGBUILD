# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kpty-git
pkgver=r46.b4630c1
pkgrel=1
pkgdesc='KPty'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kpty'
license=('LGPL')
depends=('kcoreaddons-git' 'ki18n-git' 'libutempter')
makedepends=('extra-cmake-modules-git' 'git')
groups=('kf5')
conflicts=(kpty)
provides=(kpty)
source=('git://anongit.kde.org/kpty.git')
md5sums=('SKIP')

pkgver() {
  cd kpty
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kpty \
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
