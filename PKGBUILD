# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=kimera-vio
pkgver=5.0
pkgrel=2
pkgdesc="Visual Inertial Odometry pipeline for accurate State Estimation from
Stereo/Mono + IMU data"
arch=('i686' 'x86_64')
url="https://github.com/MIT-SPARK/kimera-vio"
license=('BSD')
depends=('gtsam' 'opencv' 'opengv' 'dbow2' 'google-glog' 'gflags' 'gtest' 'kimera-rpgo')
optdepends=()
makedepends=('cmake')
_pkgname="Kimera-VIO"
source=(https://github.com/MIT-SPARK/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('6c9af01a6bd84018aab746c2ad120fede3efe391a77b118716ca9e47775e351b')

build() {

    msg "Starting CMake"

    # Create a build directory
    mkdir -p "${srcdir}/${_pkgname}-${pkgver}/build"
    cd "${srcdir}/${_pkgname}-${pkgver}/build"

    cmake .. \
        -DBUILD_TESTS=OFF \
        -DCMAKE_INSTALL_PREFIX="/usr"

    msg "Building the project"
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}/build"

    msg "Installing files"
    make DESTDIR="${pkgdir}/" install
}
