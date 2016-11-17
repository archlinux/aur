# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname='rsc-stable-git'
pkgver=0.15.1.c89d3c1
pkgrel=1
pkgdesc='Robotics Systems Commons library'
arch=('i686' 'x86_64')
url='https://projects.cor-lab.org/projects/rsc'
license=('LGPL3')
depends=('boost')
makedepends=('git' 'cmake')
source=("git+https://code.cor-lab.org/git/rsc.git#branch=0.15")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/rsc"
    printf "%s" "$(git describe --long | sed 's/release-//;s/\([^-]*-\)g/\1/;s/-/./g')"
}

build() {
    cd "${srcdir}/rsc"
    rm -rf build
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

check() {
    cd "${srcdir}/rsc/build"
    make test
}

package() {
    cd "${srcdir}/rsc/build"
    make DESTDIR="${pkgdir}/" install
}
