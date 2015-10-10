# Maintainer: Carlchristian Eckert <carli-eckert at gmx dot de>

pkgname=dout-git
pkgver=1.0.1.r2.gd0d24e2
pkgrel=1
pkgdesc="A C++ header library for minimalistic logging"
url="http://github.com/slizzered/${pkgname%-git}"
source=("${pkgname}::git://github.com/slizzered/${pkgname%-git}.git")
license=('MIT')
arch=('i686' 'x86_64')
optdepends=('cmake: easily including dout into projects')
makedepends=('git' 'cmake>=3.0.2')
sha256sums=('SKIP')

pkgver(){
    cd ${pkgname}
    RELEASE_MAJOR=$(grep -o "DOUT_VERSION_MAJOR [0-9]\+" include/dout/version.hpp | sed 's/[^0-9]//g')
    RELEASE_MINOR=$(grep -o "DOUT_VERSION_MINOR [0-9]\+" include/dout/version.hpp | sed 's/[^0-9]//g')
    RELEASE_PATCH=$(grep -o "DOUT_VERSION_PATCH [0-9]\+" include/dout/version.hpp | sed 's/[^0-9]//g')
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
