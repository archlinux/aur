# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname='rsb-proto-stable-git'
pkgver=0.15.0.9553903
pkgrel=2
pkgdesc='Robotics Service Bus Communication Protocol'
arch=(any)
url='https://projects.cor-lab.org/projects/rsb'
license=('LGPL3')
depends=()
makedepends=('git' 'cmake' 'rsc-stable-git')
source=("rsb-proto::git+https://code.cor-lab.org/git/rsb.git.protocol#branch=0.15")
md5sums=('SKIP')
conflicts=('rsb-proto')
provides=('rsb-proto')

pkgver() {
    cd "${srcdir}/rsb-proto"
    printf "%s" "$(git describe --long | sed 's/release-//;s/\([^-]*-\)g/\1/;s/-/./g')"
}

build() {
    cd "${srcdir}/rsb-proto"
    rm -rf build
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    cd "${srcdir}/rsb-proto/build"
    make DESTDIR="${pkgdir}/" install
}
