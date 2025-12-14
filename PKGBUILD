# Maintainer: Davide Gerhard <rainbow@irh.it>

pkgname=gr-satellites
pkgver=5.9.0
pkgrel=1
pkgdesc="satellite decoder blocks for GNURadio"
arch=('x86_64' 'aarch64')
url="https://github.com/daniestevez/gr-satellites"
license=('GPL3')
depends=('gnuradio' 'boost-libs' 'python-construct>=2.9' 'python-requests' 'fmt' 'gnuradio-iqbal')
optdepends=('feh: For realtime image decoders'
            'doxygen: For document generation')
makedepends=('cmake' 'boost' 'pybind11')
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c9a33e85599918a7e13adcd0636a77a580544886895a25eb303b15609a77a416')

build() {
    cmake -B build -S $pkgname-$pkgver \
       -DCMAKE_BUILD_TYPE=Release \
       -DCMAKE_INSTALL_PREFIX=/usr \
       -DCMAKE_SKIP_RPATH=YES \
       -Wno-dev

    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
}
