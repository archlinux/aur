# Maintainer : Cazimi <gorheledion at gmail dot com>
# Maintainer : Splashy <splash at mailoo dot org>
pkgname=('virtuality-qt5-git')
pkgver=r110.22ba423
pkgrel=2
pkgdesc='qt5 widget style'
arch=('i686' 'x86_64')
url='https://github.com/luebking/virtuality'
license=('GPL2')
makedepends=('cmake' 'extra-cmake-modules' 'automoc4' 'git')
source=('git://github.com/luebking/virtuality.git')
md5sums=('SKIP')

pkgver() {
  cd virtuality
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
  cd virtuality
  mkdir -p build5
  cd build5
  cmake .. -DCMAKE_BUILD_TYPE=Release \
           -DCMAKE_INSTALL_PREFIX=/usr \
           -DWITH_QT5=ON ..
  make
}

package() {
  depends=('qt5-x11extras')
  cd virtuality/build5
  make DESTDIR="$pkgdir" install
}
