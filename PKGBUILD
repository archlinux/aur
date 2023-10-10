# Maintainer: Davide Gerhard <rainbow@irh.it>

pkgname=gr-satellites
pkgver=5.4.0
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
sha256sums=('4073bcacdc66caf785c7fedefd72f9ee16ba48c21d13822392e31a1fcc83e04f')

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
