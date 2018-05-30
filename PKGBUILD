pkgname=gr-lte-git
pkgver=r217.7288cc3
pkgrel=1
pkgdesc="GNU Radio LTE receiver"
url="https://github.com/kit-cel/gr-lte"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('gnuradio')
makedepends=('git' 'cmake' 'swig' 'zeitgeist')
checkdepends=('python2-matplotlib')
source=('git+https://github.com/kit-cel/gr-lte.git') 
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/gr-lte"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    mkdir -p "$srcdir/gr-lte-build"
    cd "$srcdir/gr-lte-build"
    
    cmake "$srcdir/gr-lte" \
        -Wno-dev \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="/usr"
    make
}

check() {
    cd "$srcdir/gr-lte-build"
    make test
}

package() {
    cd "$srcdir/gr-lte-build"
    make DESTDIR="$pkgdir" install
}
