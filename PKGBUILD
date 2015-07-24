# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=akonadi-search-git
pkgver=r490.007a017
pkgrel=1
pkgdesc="Libraries and daemons to implement searching in Akonadi. (GIT version)"
url='https://projects.kde.org/projects/playground/pim/akonadi-search'
arch=(i686 x86_64)
license=(GPL LGPL FDL)
depends=(xapian-core kdepimlibs-git)
makedepends=(extra-cmake-modules kdoctools git)
provides=(akonadi-search)
conflicts=(akonadi-search)
source=("git://anongit.kde.org/akonadi-search")
sha1sums=('SKIP')
_gitname=akonadi-search

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  rm -fr build
  mkdir -p build
}

build() {
  cd build
  cmake "../${_gitname}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR=${pkgdir} install
}

