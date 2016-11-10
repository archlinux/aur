# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname='rsb-spread-cpp'
pkgver=0.15.0.84e9019
pkgrel=2
pkgdesc='Robotics Service Bus C++ spread transport'
arch=('i686' 'x86_64')
url='https://projects.cor-lab.org/projects/rsb'
license=('LGPL3')
depends=('rsc' 'boost' 'protobuf' 'spread-daemon' 'rsb-cpp')
makedepends=('git' 'cmake')
checkdepends=('python2')
source=("rsb-spread-cpp::git+https://code.cor-lab.org/git/rsb.git.spread-cpp#branch=0.15")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/rsb-spread-cpp"
    printf "%s" "$(git describe --long | sed 's/release-//;s/\([^-]*-\)g/\1/;s/-/./g')"
}

check() {
    cd "${srcdir}/rsb-spread-cpp/build"
    make test
}

build() {
    cd "${srcdir}/rsb-spread-cpp"
    rm -rf build
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    cd "${srcdir}/rsb-spread-cpp/build"
    make DESTDIR="${pkgdir}/" install
}
