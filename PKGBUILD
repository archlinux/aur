# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libkdeaccessibilityclient-git
pkgver=r242.f98b97b
pkgrel=1
pkgdesc="A screen magnifier. KF5 Frameworks branch (GIT version)"
url='http://kde.org/applications/utilities/libkdeaccessibilityclient'
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('qt5-base')
makedepends=('cmake' 'git')
conflicts=('libkdeaccessibilityclient')
provides=('libkdeaccessibilityclient')
source=('git://anongit.kde.org/libkdeaccessibilityclient')
sha1sums=('SKIP')

pkgver() {
  cd libkdeaccessibilityclient
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../libkdeaccessibilityclient \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DQT4_BUILD=OFF \
    -DKDE4_BUILD_TESTS=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
