# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname='rsb-tools-cpp'
pkgver=0.14.0.5bfe7ca
pkgrel=1
pkgdesc='Robotics Service Bus C++ tools'
arch=('i686' 'x86_64')
url='https://projects.cor-lab.org/projects/rsb'
license=('LGPL3')
depends=('rsc' 'boost' 'protobuf' 'rsb-cpp')
makedepends=('git' 'cmake')
checkdepends=('python2')
source=("rsb-tools-cpp::git+https://code.cor-lab.org/git/rsb.git.tools-cpp#branch=0.14")
md5sums=('SKIP')

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
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    cd "${srcdir}/rsb-tools-cpp/build"
    make DESTDIR="${pkgdir}/" install
}
