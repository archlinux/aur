# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname='rsb-tools-cpp-stable-git'
pkgver=0.15.0.6c5e3b7
pkgrel=1
pkgdesc='Robotics Service Bus C++ tools'
arch=('i686' 'x86_64')
url='https://projects.cor-lab.org/projects/rsb'
license=('LGPL3')
depends=('rsc-stable-git' 'boost' 'protobuf' 'rsb-cpp-stable-git')
makedepends=('git' 'cmake')
checkdepends=('python2')
source=("rsb-tools-cpp::git+https://code.cor-lab.org/git/rsb.git.tools-cpp#branch=0.15")
md5sums=('SKIP')
conflicts=('rsb-tools-cpp')
provides=('rsb-tools-cpp')

pkgver() {
    cd "${srcdir}/rsb-tools-cpp"
    printf "%s" "$(git describe --long | sed 's/release-//;s/\([^-]*-\)g/\1/;s/-/./g')"
}

check() {
    cd "${srcdir}/rsb-tools-cpp/build"
    make test
}

build() {
    cd "${srcdir}/rsb-tools-cpp"
    rm -rf build
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    cd "${srcdir}/rsb-tools-cpp/build"
    make DESTDIR="${pkgdir}/" install
}
