pkgname=jackman-kcm-git
pkgver=r33.9d24d09
pkgrel=1
pkgdesc="KCM module for jackman"
arch=('i686' 'x86_64')
url="https://github.com/progwolff/jackman_kcm"
provides=('jackman-kcm')
license=("GPL")
depends=('jackman' 'xdg-utils' 'kdeclarative' 'kdelibs' 'plasma-framework')
makedepends=('git' 'extra-cmake-modules' 'qt5-tools' 'python')
source=('jackman_kcm::git+https://github.com/progwolff/jackman_kcm.git')
md5sums=('SKIP')

_gitroot="https://github.com/progwolff/jackman_kcm.git"
_gitname=jackman_kcm

pkgver() {
  cd "$_gitname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir"

  mkdir -p build
  cd build

  cmake ../${_gitname} -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR="${pkgdir}" install
}

