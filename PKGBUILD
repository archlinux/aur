# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname='rsb-gstreamer'
pkgver=0.15.0.5f4e948
pkgrel=1
pkgdesc='RSB GStreamer plugins'
arch=('i686' 'x86_64')
url='https://projects.cor-lab.org/projects/rsb-gstreamer'
license=('LGPL3')
depends=('rsc' 'rsb-cpp' 'gstreamer0.10' 'gstreamer0.10-base')
makedepends=('git' 'cmake')
source=("rsb-gstreamer::git+https://code.cor-lab.org/git/rsb-gstreamer.git#branch=0.15")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/rsb-gstreamer"
    printf "%s" "$(git describe --long | sed 's/release-//;s/\([^-]*-\)g/\1/;s/-/./g')"
}

check() {
    cd "${srcdir}/rsb-gstreamer/build"
    make test
}

build() {
    cd "${srcdir}/rsb-gstreamer"
    rm -rf build
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    cd "${srcdir}/rsb-gstreamer/build"
    make DESTDIR="${pkgdir}/" install
}
