# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: mensinda <daniel@mensinger-ka.de>
# Contributor: mosra <mosra@centrum.cz>
pkgname=kdevelop-clang-git
pkgver=r664.caf0117
pkgrel=1
pkgdesc="Clang integration plugin for KDevelop"
arch=('i686' 'x86_64')
url="http://www.kdevelop.org/"
license=('GPL')
depends=('kdevelop-git' 'clang' 'llvm' )
makedepends=('cmake' 'git' 'extra-cmake-modules')
provides=('kdevelop-clang')
install=kdevelop-clang.install
source=('git+git://anongit.kde.org/kdev-clang')
sha256sums=('SKIP')

pkgver() {
  cd kdev-clang
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p build
  cd build

  cmake ../kdev-clang \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON

  make
}

package() {
  cd build

  make DESTDIR="${pkgdir}" install
}
