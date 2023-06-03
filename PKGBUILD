# Maintainer: Davide Gerhard <rainbow@irh.it>

pkgname=gr-satellites
pkgver=5.3.0
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
sha256sums=('c6b07787a515eeaa01f74c1415406f2c20b6c79551757e55bfe85ceb53b06e32')

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
