# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributo: Benjamin Chretien <chretien at lirmm dot fr>
pkgname=simbody
pkgver=3.7
pkgrel=1
pkgdesc="High-performance C++ multibody dynamics/physics library for simulating articulated biomechanical and mechanical systems like vehicles, robots, and the human skeleton."
arch=('i686' 'x86_64')
url="https://simtk.org/home/simbody"
license=('Apache')
depends=('lapack' 'blas')
optdepends=('freeglut' 'libxi' 'libxmu' 'doxygen')
makedepends=('cmake')

_dir="${pkgname}-Simbody-${pkgver}"
source=("https://github.com/simbody/${pkgname}/archive/Simbody-${pkgver}.tar.gz")
sha256sums=('d371a92d440991400cb8e8e2473277a75307abb916e5aabc14194bea841b804a')

build() {
    # Create a build directory
    mkdir -p "${srcdir}/${_dir}/build"
    cd "${srcdir}/${_dir}/build"

    # Build project
    cmake \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_INSTALL_LIBDIR="lib" \
        "${srcdir}/${_dir}"

    make
}

package() {
    cd "${srcdir}/${_dir}/build"
    make DESTDIR="${pkgdir}/" install
}
