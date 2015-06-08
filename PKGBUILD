# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdewebkit-git
pkgver=r45.8f9e1ed
pkgrel=1
pkgdesc='KDE Webkit'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kdewebkit'
license=('LGPL')
depends=('qt5-webkit' 'kparts-git')
makedepends=('extra-cmake-modules-git' 'git')
groups=('kf5')
conflicts=(kdewebkit)
provides=(kdewebkit)
source=('git://anongit.kde.org/kdewebkit.git')
md5sums=('SKIP')

pkgver() {
  cd kdewebkit
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kdewebkit \
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
