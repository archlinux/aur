# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=kimera-rpgo-git
pkgver=r255.d48028d
pkgrel=1
pkgdesc="Robust backend optimization"
arch=('i686' 'x86_64')
url="https://github.com/MIT-SPARK/kimera-rpgo"
license=('BSD')
depends=('gcc' 'gtsam')
optdepends=()
makedepends=('gcc' 'cmake')
provides=(kimera-rpgo)
source=("git+https://github.com/MIT-SPARK/kimera-rpgo.git")
sha256sums=('SKIP')
_name=kimera-rpgo
pkgver() {
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {

    msg "Starting CMake"

    # Create a build directory
    mkdir -p "${srcdir}/${_name}/build"
    cd "${srcdir}/${_name}/build"

    cmake .. \
        -DCMAKE_INSTALL_PREFIX="/usr"

    msg "Building the project"
    make
}

package() {
    cd "${srcdir}/${_name}/build"

    msg "Installing files"
    make DESTDIR="${pkgdir}/" install
}
