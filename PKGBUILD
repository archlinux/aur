# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=gpmp2-git
pkgver=r98.c33e9ef
pkgrel=1
pkgdesc="Gaussian Process Motion Planner 2"
arch=('i686' 'x86_64')
url="https://github.com/gtrll/gpmp2"
license=('BSD')
depends=('boost' 'gtsam')
makedepends=('cmake')
provides=('gpmp2')
conflicts=('gpmp2')
source=("${pkgname}::git+https://github.com/gtrll/gpmp2")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    sed -i 's/GPMP2_VERSION_STRING/gpmp2_VERSION_STRING/g' "${srcdir}/${pkgname}/CMakeLists.txt"
}

build() {
    # Create a build directory
    mkdir -p "${srcdir}/${pkgname}-build"
    cd "${srcdir}/${pkgname}-build"

    cmake \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        "${srcdir}/${pkgname}"

    make
}

package() {
    cd "${srcdir}/${pkgname}-build"
    make DESTDIR="${pkgdir}/" install
}
