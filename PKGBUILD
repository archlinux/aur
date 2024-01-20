# Maintainer: Davide Gerhard <rainbow@irh.it>

pkgname=gr-satellites
pkgver=5.5.0
pkgrel=1
pkgdesc="satellite decoder blocks for GNURadio"
arch=('x86_64' 'aarch64')
url="https://github.com/daniestevez/gr-satellites"
license=('GPL3')
depends=('gnuradio' 'python-construct>=2.9' 'python-requests' 'fmt' 'gnuradio-iqbal')
optdepends=('feh: For realtime image decoders'
            'doxygen: For document generation')
makedepends=('cmake')
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5c5b593259b168be8d3a1c10b385a4dd03ffc5f0113e9a95c8ee749dfb9bd77b')

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
