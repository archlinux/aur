pkgname=gr-drm-git
pkgver=r278.9d9b45a
pkgrel=1
pkgdesc="DRM transmitter using GNU Radio"
url="https://github.com/kit-cel/gr-drm"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('gnuradio' 'boost-libs' 'faac')
makedepends=('git' 'cmake' 'boost' 'swig' 'doxygen')
source=('git+https://github.com/kit-cel/gr-drm') 
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/gr-drm"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    mkdir -p "$srcdir/gr-drm-build"
    cd "$srcdir/gr-drm-build"
    
    cmake "$srcdir/gr-drm" \
        -Wno-dev \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="/usr"
    make
}

check() {
    cd "$srcdir/gr-drm-build"
    make test
}

package() {
    cd "$srcdir/gr-drm-build"
    make DESTDIR="$pkgdir" install
}
