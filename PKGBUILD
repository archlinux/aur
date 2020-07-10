# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

_gitname=kdev-valgrind
pkgname=kdevelop-valgrind-git
pkgver=r1140.cc8fa04
pkgrel=2
pkgdesc="A plugin offering a full integration of the valgrind suite to KDevelop (latest development version)"
arch=('x86_64')
url='http://www.kdevelop.org'
license=('GPL')
depends=('qt5-base' 'valgrind')
conflicts=('kdevelop-valgrind' 'kdev-valgrind')
provides=('kdevelop-valgrind')
makedepends=('git' 'extra-cmake-modules')
source=("git+https://invent.kde.org/kdevelop/kdev-valgrind.git")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd  "${srcdir}/${_gitname}"
  mkdir -p build
}

build() {
  cd "${srcdir}/${_gitname}/build"
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd "${srcdir}/${_gitname}/build"
  make DESTDIR="${pkgdir}" install
}
