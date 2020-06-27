# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=kscreen-git
pkgver=r1266.65f342d
pkgrel=1
pkgdesc='KDE screen management software'
arch=(i686 x86_64)
url='https://projects.kde.org/projects/kde/workspace/kscreen'
license=('LGPL')
depends=('kxmlgui' 'libkscreen-git' 'qt5-graphicaleffects' 'hicolor-icon-theme')
makedepends=('extra-cmake-modules' 'git' 'python')
provides=(kscreen)
conflicts=(kscreen)
install=$pkgname.install
source=('git+https://github.com/KDE/kscreen.git')
groups=('plasma')
md5sums=('SKIP')

pkgver() {
  cd kscreen
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kscreen \
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
