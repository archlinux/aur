# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=user-manager
pkgver=5.2.95
pkgrel=1
pkgdesc="A simple system settings module to manage the users of your system (GIT version)"
url='https://projects.kde.org/projects/kdereview/user-manager'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
groups=('plasma-next')
depends=('libpwquality' 'kdelibs4support')
makedepends=('extra-cmake-modules' 'kdoctools' 'cmake')
source=("http://download.kde.org/unstable/plasma/$pkgver/$pkgname-$pkgver.tar.xz")
md5sums=('2facfbb9477656b8d9659a5849edfb05')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../user-manager-$pkgver \
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
