# Maintainer: Sándor Nagy <sanya868 at gmail dot com>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=kompare-git
pkgver=r855.bfd5dc3
pkgrel=1
pkgdesc="Diff/Patch Frontend. (GIT version)"
url="https://www.kde.org/applications/development/kompare"
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('libkomparediff2-git' 'ktexteditor' 'desktop-file-utils')
makedepends=('extra-cmake-modules' 'kdoctools' 'git')
conflicts=('kdesdk-kompare' 'kompare')
provides=('kompare')
source=("git://anongit.kde.org/kompare.git")
sha1sums=('SKIP')
install="kompare-git.install"

pkgver() {
  cd kompare
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build

  sed 's|${DATA_INSTALL_DIR}|${KXMLGUI_INSTALL_DIR}|g' -i kompare{,/komparepart}/CMakeLists.txt
}

build() {
  cd build

  cmake ../kompare \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
