# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=kmenuedit-git
pkgver=r929.4289215
pkgrel=1
pkgdesc='KDE menu editor'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kde-workspace'
license=('LGPL')
depends=('khotkeys-git')
makedepends=('extra-cmake-modules-git' 'git' 'kdoctools-git')
conflicts=('kmenuedit' 'kdebase-workspace')
provides=('kmenuedit')
install=$pkgname.install
source=('git+https://github.com/KDE/kmenuedit.git')
groups=('plasma')
md5sums=('SKIP')

pkgver() {
  cd kmenuedit
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kmenuedit \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
