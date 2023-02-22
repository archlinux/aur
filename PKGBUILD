# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Benjamin Chretien <chretien at lirmm dot fr>

pkgname=pagmo-git
pkgver=r4252.1525ce0d
pkgrel=2
pkgdesc="Perform parallel computations of optimisation tasks (global and local)
via the asynchronous generalized island model (git version)"
arch=('i686' 'x86_64')
url="https://github.com/esa/pagmo2"
license=('GPLv3')
depends=('boost' 'tbb' 'coin-or-ipopt' 'eigen' 'nlopt')
makedepends=('git' 'cmake')
_name=pagmo2
provides=('pagmo')
conflicts=('pagmo')
source=("git+https://github.com/esa/pagmo2.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    # Create a build directory
    mkdir -p "${srcdir}/${_name}-build"
    cd "${srcdir}/${_name}-build"

    cmake \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DPAGMO_WITH_IPOPT=ON \
        -DPAGMO_WITH_EIGEN3=ON \
        -DPAGMO_WITH_NLOPT=ON \
        -DPAGMO_ENABLE_IPO=yes \
        "${srcdir}/${_name}"

    make
}

package() {
    cd "${srcdir}/${_name}-build"
    make DESTDIR="${pkgdir}/" install
}
