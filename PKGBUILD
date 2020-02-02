# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=cppfs-git
pkgver=r147.156d72e
pkgrel=1
pkgdesc="Cross-platform C++ file system library supporting multiple backends"
arch=('i686' 'x86_64')
url="https://github.com/cginternals/cppfs"
license=('MIT')
depends=()
makedepends=('cmake' 'git')
optdepends=('cppcheck')
_pkgname=cppfs
provides=('cppfs')
conflicts=('cppfs')
source=("git+https://github.com/cginternals/cppfs")
md5sums=("SKIP")

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "$srcdir/${_pkgname}/build"
  cd "$srcdir/${_pkgname}/build"
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        ..
  make
}

package() {
  cd "${srcdir}/${_pkgname}/build"
  make DESDIR=${pkgdir} install
}
