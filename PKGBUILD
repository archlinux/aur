# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname='rst-proto'
pkgver=0.14.2.7ca78f8
pkgrel=1
pkgdesc='Robotics Systems Types library'
arch=('i686' 'x86_64')
url='https://projects.cor-lab.org/projects/rsb'
license=('LGPL3')
depends=('protobuf' 'python2' 'python2-protobuf' 'apache-ant' 'protobuf-java')
makedepends=('git' 'cmake' 'rsc')
source=("rst-proto::git+https://code.cor-lab.org/git/rst.git.proto#branch=0.14")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/rst-proto"
    printf "%s" "$(git describe --long | sed 's/release-//;s/\([^-]*-\)g/\1/;s/-/./g')"
}

build() {
    cd "${srcdir}/rst-proto"
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    cd "${srcdir}/rst-proto/build"
    make DESTDIR="${pkgdir}/" install
}
