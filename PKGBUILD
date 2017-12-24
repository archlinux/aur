# Maintainer: krepa098 <krepa098@gmail.com>

_pkgname=stl2thumbnail
pkgname=stl2thumbnail-git
pkgver=v0.1.r1.ge58f3f3
pkgrel=1
pkgdesc="Enables file managers to generate thumbnails for STL files"
arch=("i686" "x86_64")
url="https://github.com/krepa098/stl2thumbnail"
license=("GPL")
groups=()
depends=("libpng")
makedepends=("git" "cmake" "glm")
source=("$_pkgname::git+$url.git#branch=master")
md5sums=("SKIP")

_gitname="stl2thumbnail"
_gitbranch="master"

pkgver() {
  cd "${_pkgname}"
  git describe --long | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

build() {
  cd "${_pkgname}/build"
  cmake .. -DCMAKE_INSTALL_PREFIX="/usr"
  cmake --build . --config Release
}

prepare() {
  cd "${_pkgname}"
  mkdir -p build
}

package() {
  cd "${_pkgname}/build"
  make DESTDIR="${pkgdir}/" install
}
