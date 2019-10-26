# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=kimera-vio
pkgver=4.0
pkgrel=1
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
sha256sums=('63ea165213554b53af0e075bdb96c333dc7a8a4a60c5c8d2b8abe4e8c5f93a78')

build() {

    msg "Starting CMake"

    # Create a build directory
    mkdir -p "${srcdir}/${_pkgname}-${pkgver}/build"
    cd "${srcdir}/${_pkgname}-${pkgver}/build"

    cmake .. \
        -DCMAKE_INSTALL_PREFIX="/usr"

    msg "Building the project"
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}/build"

    msg "Installing files"
    make DESTDIR="${pkgdir}/" install
}
