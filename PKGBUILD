# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdnssd-git
pkgver=r66.0f5f15e
pkgrel=1
pkgdesc='Abstraction to system DNSSD features'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kdnssd'
license=('LGPL')
depends=('qt5-base' 'avahi' 'nss-mdns')
makedepends=('extra-cmake-modules-git' 'git')
groups=('kf5')
conflicts=('kdnssd')
provides=('kdnssd')
source=('git://anongit.kde.org/kdnssd.git')
md5sums=('SKIP')

pkgver() {
  cd kdnssd
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kdnssd \
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
