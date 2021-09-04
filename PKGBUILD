# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: Gonçalo Camelo Neves Pereira <goncalo_pereira@outlook.pt>
# Contributor: midgard <arch dot midgard "at symbol" janmaes "youknowwhat" com>

pkgname=libdart
pkgver=6.11.1
pkgrel=1
pkgdesc="Dynamic Animation and Robotics Toolkit"
arch=('i686' 'x86_64')
url="https://dartsim.github.io"
license=('BSD')
depends=('assimp' 'boost' 'eigen' 'fcl' 'libccd' 'bullet' 'coin-or-ipopt'
         'flann' 'nlopt' 'octomap' 'ode' 'openscenegraph' 'tinyxml2' 'urdfdom'
         'glu' 'freeglut' 'libxi' 'libxmu' 'pagmo')
optdepends=('pagmo: pagmo optimizer support')
makedepends=('cmake')
provides=('dartsim')
_pkgname=dart
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dartsim/${_pkgname}/archive/v${pkgver}.tar.gz"
        "bracket.patch")
sha256sums=('1a59b9d8f55433ad111089431826cd8abbec71f61c72a8558b655d92164f8de4'
            'a6608b7f86aa412ed2e2395010fdb6fb47d34efbdb37b767427c8f02cb8eca65')

prepare(){
    cd "dart-$pkgver"
    patch --forward --strip=1 --input="${srcdir}/bracket.patch"
}

build() {
    mkdir -p "${srcdir}/${_pkgname}-${pkgver}/build"
    cd "${srcdir}/${_pkgname}-${pkgver}/build"

    cmake .. \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_INSTALL_LIBDIR="lib" \

    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}/build"

    make DESTDIR="${pkgdir}/" install
}
