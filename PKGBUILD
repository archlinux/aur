# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=cnpy-git
pkgver=r53.4e8810b
pkgrel=2
pkgdesc='Library to read/write .npy and .npz files in C/C++'
arch=('i686' 'x86_64')
url='https://github.com/rogersce/cnpy'
license=('MIT')
depends=()
optdepends=()
makedepends=('cmake' 'git')
_name=cnpy
provides=('cnpy')
source=("git+https://github.com/rogersce/cnpy.git")
md5sums=('SKIP')

pkgver() {
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # Creating build directory
  cd "${srcdir}/${_name}/"
  mkdir -p "build"
  cd "build"

  msg "Starting CMake"

  cmake .. \
    -DCMAKE_PREFIX_PATH='/usr' \
    -DCMAKE_INSTALL_PREFIX='/usr'

  msg "Building the project"
  make
}

package() {
  msg "Installing files"

  cd "${srcdir}/${_name}/build/"
  make DESTDIR="${pkgdir}/" install
}
