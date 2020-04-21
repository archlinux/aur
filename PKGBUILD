# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Joey Dumont <joey.dumont@gmail.com>

pkgname=pagmo
pkgver=2.15.0
pkgrel=3
pkgdesc="Perform parallel computations of optimisation tasks (global and local) via the asynchronous generalized island model"
arch=('i686' 'x86_64')
url="https://github.com/esa/pagmo2"
license=('GPLv3')
depends=('boost' 'intel-tbb' 'coin-or-ipopt' 'eigen' 'nlopt')
makedepends=('cmake')
_name=pagmo2
source=(https://github.com/esa/${_name}/archive/v${pkgver}.tar.gz)
sha256sums=('07977be690b512ea11fc40d5b8bfa0a7a8507ce9053a615c2bc4725d355ef9a8')

build() {
    # Create a build directory
    mkdir -p "${srcdir}/${_name}-${pkgver}-build"
    cd "${srcdir}/${_name}-${pkgver}-build"

    cmake \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DPAGMO_WITH_IPOPT=ON \
        -DPAGMO_WITH_EIGEN3=ON \
        -DPAGMO_WITH_NLOPT=ON \
        "${srcdir}/${_name}-${pkgver}"

    make
}

package() {
    cd "${srcdir}/${_name}-${pkgver}-build"
    make DESTDIR="${pkgdir}/" install
}
