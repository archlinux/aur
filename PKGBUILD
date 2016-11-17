# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname='rsb-cpp-stable-git'
pkgver=0.15.0.6bbb74e
pkgrel=1
pkgdesc='Robotics Service Bus C++ implementation'
arch=('i686' 'x86_64')
url='https://projects.cor-lab.org/projects/rsb'
license=('LGPL3')
depends=('rsc-stable-git' 'boost' 'protobuf')
makedepends=('git' 'cmake' 'rsb-proto-stable-git')
checkdepends=('python2')
source=("rsb-cpp::git+https://code.cor-lab.org/git/rsb.git.cpp#branch=0.15")
md5sums=('SKIP')
conflicts=('rsb-cpp')
provides=('rsb-cpp')

pkgver() {
    cd "${srcdir}/rsb-cpp"
    printf "%s" "$(git describe --long | sed 's/release-//;s/\([^-]*-\)g/\1/;s/-/./g')"
}

check() {
    cd "${srcdir}/rsb-cpp/build"
    make test
}

build() {
    cd "${srcdir}/rsb-cpp"
    rm -rf build
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    cd "${srcdir}/rsb-cpp/build"
    make DESTDIR="${pkgdir}/" install
}
