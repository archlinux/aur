# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=kimera-rpgo-git
pkgver=r409.19436dc
pkgrel=1
pkgdesc="Robust backend optimization"
arch=('i686' 'x86_64')
url="https://github.com/MIT-SPARK/kimera-rpgo"
license=('BSD')
depends=('gtsam')
makedepends=('cmake' 'boost' 'git')
provides=(kimera-rpgo)
source=("git+https://github.com/MIT-SPARK/kimera-rpgo.git")
sha256sums=('SKIP')
_name=kimera-rpgo
pkgver() {
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    mkdir -p "${srcdir}/${_name}/build"
    cd "${srcdir}/${_name}/build"

    cmake .. \
        -DCMAKE_INSTALL_PREFIX="/usr"

    make
}

package() {
    cd "${srcdir}/${_name}/build"
    make DESTDIR="${pkgdir}/" install
}
