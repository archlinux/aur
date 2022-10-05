# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=kdevelop-valgrind-git
pkgver=r1155.d670475
pkgrel=1
pkgdesc="A plugin offering a full integration of the valgrind suite to KDevelop (latest development version)"
arch=('x86_64')
url='https://invent.kde.org/kdevelop/kdev-valgrind'
license=('GPL2')
depends=('qt5-base' 'valgrind' 'kdevelop')
conflicts=('kdevelop-valgrind')
provides=('kdevelop-valgrind')
makedepends=('git' 'extra-cmake-modules')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RelWithDebInfo -DLIB_INSTALL_DIR=lib -B build -S "${pkgname}"
  cmake --build build --config RelWithDebInfo
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config RelWithDebInfo
}
