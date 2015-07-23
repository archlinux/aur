# Maintainer: Bhushan Shah <bshah@kde.org>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=kcm-user-manager-git
pkgver=r274.e74e910
pkgrel=1
pkgdesc="A simple system settings module to manage the users of your system (GIT version)"
url='https://projects.kde.org/user-manager'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('accountsservice' 'libpwquality' 'kdelibs4support')
makedepends=('extra-cmake-modules' 'kdoctools' 'git')
conflicts=('kcm-user-manager' 'user-manager')
provides=('kcm-user-manager' 'user-manager')
groups=('plasma')
source=('git://anongit.kde.org/user-manager')
sha1sums=('SKIP')

pkgver() {
  cd user-manager
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../user-manager \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
