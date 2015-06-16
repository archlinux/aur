# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=kcharselect-git
pkgver=1.12.r295.276f21d
pkgrel=1
pkgdesc="Character Selector. (GIT version)"
url='https://www.kde.org/applications/utilities/kcharselect'
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('kxmlgui')
makedepends=('extra-cmake-modules' 'kdoctools' 'git')
conflicts=('kcharselect' 'kdeutils-kcharselect')
provides=('kcharselect')
source=("git://anongit.kde.org/kcharselect.git")
sha1sums=('SKIP')
install=kcharselect-git.install

pkgver() {
  cd kcharselect
  _ver="$(cat main.cc | grep -m1 'KDE character selection utility' | cut -d '"' -f2)"
  echo -e "${_ver// /.}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kcharselect \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTS=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
