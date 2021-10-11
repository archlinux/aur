# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=gpmp2
pkgver=0.3.0
pkgrel=1
pkgdesc="Gaussian Process Motion Planner 2"
arch=('i686' 'x86_64')
url="https://github.com/gtrll/gpmp2"
license=('BSD')
depends=('boost' 'gtsam')
makedepends=('cmake')
source=("${pkgname}-${pkgver}::https://github.com/gtrll/gpmp2/archive/${pkgver}.tar.gz")
sha256sums=('d2c6dafe1518b4dad6bb6210b23d195843d0fa3b59feb3dda986ec0512ac5166')

prepare() {
    sed -i 's/GPMP2_VERSION_STRING/gpmp2_VERSION_STRING/g' "${srcdir}/${pkgname}-${pkgver}/CMakeLists.txt"
}

build() {
    # Create a build directory
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build"
    cd "${srcdir}/${pkgname}-${pkgver}-build"

    cmake \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        "${srcdir}/${pkgname}-${pkgver}"

    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}-build"
    make DESTDIR="${pkgdir}/" install
}
