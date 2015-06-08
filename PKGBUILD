# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=frameworkintegration-git
pkgver=r167.805ad18
pkgrel=1
pkgdesc='Framework providing components to allow applications to integrate with a KDE Workspace'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/frameworkintegration'
license=('LGPL')
depends=('kio-git' 'ttf-oxygen' 'libxcursor')
makedepends=('extra-cmake-modules-git' 'git')
groups=('kf5')
conflicts=(frameworkintegration)
provides=(frameworkintegration)
source=('git://anongit.kde.org/frameworkintegration.git')
md5sums=('SKIP')

pkgver() {
  cd frameworkintegration
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../frameworkintegration \
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
