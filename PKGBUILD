# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdesignerplugin-git
pkgver=r284.02b377a
pkgrel=1
pkgdesc='KDesignerPlugin'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kdesignerplugin'
license=('LGPL')
depends=('kplotting-git' 'kdewebkit-git')
makedepends=('extra-cmake-modules-git' 'git' 'qt5-tools' 'kdoctools-git' 'python')
groups=('kf5')
conflicts=('kdesignerplugin')
provides=('kdesignerplugin')
source=('git+https://github.com/KDE/kdesignerplugin.git')
md5sums=('SKIP')

pkgver() {
  cd kdesignerplugin
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kdesignerplugin \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
