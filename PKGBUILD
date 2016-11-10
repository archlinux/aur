# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname='rst-proto'
pkgver=0.15.0.0272643
pkgrel=2
pkgdesc='Robotics Systems Types library'
arch=('i686' 'x86_64')
url='https://projects.cor-lab.org/projects/rst'
license=('LGPL3')
depends=('protobuf' 'python2' 'python2-protobuf' 'apache-ant' 'protobuf-java')
makedepends=('git' 'cmake' 'rsc')
source=("rst-proto::git+https://code.cor-lab.org/git/rst.git.proto#branch=0.15")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/rst-proto"
    printf "%s" "$(git describe --long | sed 's/release-//;s/\([^-]*-\)g/\1/;s/-/./g')"
}

build() {
    cd "${srcdir}/rst-proto"
    rm -rf build
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    cd "${srcdir}/rst-proto/build"
    make DESTDIR="${pkgdir}/" install
}
