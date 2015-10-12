# Maintainer: Erik Zenker <erikzenker at posteo dot de>

pkgname=graybat-git
pkgver=1.0.0.
pkgrel=1
pkgdesc="Graph Approach for Highly Generic Communication Schemes Based on Adaptive Topologies"
url="http://github.com/ComputationalRadiationPhysics/${pkgname%-git}"
source=("${pkgname}::git://github.com/ComputationalRadiationPhysics/${pkgname%-git}.git")
license=('LGPL')
arch=('i686' 'x86_64')
optdepends=('cmake: easily including graybat into projects')
makedepends=('git' 'cmake>=3.3.0' )
depends=('boost>=1.56.0' 'zeromq>=4.1.3' 'openmpi>=1.8.0')
sha256sums=('SKIP')

pkgver(){
    cd ${pkgname}
    RELEASE_MAJOR=$(grep -o "graybat_VERSION_MAJOR [0-9]\+" include/graybat/version.hpp | sed 's/[^0-9]//g')
    RELEASE_MINOR=$(grep -o "graybat_VERSION_MINOR [0-9]\+" include/graybat/version.hpp | sed 's/[^0-9]//g')
    RELEASE_PATCH=$(grep -o "graybat_VERSION_PATCH [0-9]\+" include/graybat/version.hpp | sed 's/[^0-9]//g')
    REVISION=$(git describe --long --tags | sed 's/[0-9.]\+-//;s/\([^-]*-g\)/r\1/;s/-/./g')
    echo ${RELEASE_MAJOR}.${RELEASE_MINOR}.${RELEASE_PATCH}.${REVISION}
}

build(){
    cd ${pkgname}
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
}

package(){
    cd ${pkgname}
    make DESTDIR=${pkgdir} install
}
