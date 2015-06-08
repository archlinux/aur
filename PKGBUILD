# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=krunner-git
pkgver=r92.2d6d560
pkgrel=1
pkgdesc='Framework for providing different actions given a string query'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/krunner'
license=('LGPL')
depends=('threadweaver-git' 'plasma-framework-git')
makedepends=('extra-cmake-modules-git' 'git')
groups=('kf5')
conflicts=('krunner')
provides=('krunner')
source=('git://anongit.kde.org/krunner.git')
md5sums=('SKIP')

pkgver() {
  cd krunner
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../krunner \
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
