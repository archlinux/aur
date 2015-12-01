# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=gr-dsd-git
pkgver=r56.d2f0270
pkgrel=1
pkgdesc="GNU Radio block for Digital Speech Decoder (DSD)"
arch=('i686' 'x86_64')
url="https://github.com/argilo/gr-dsd"
license=('GPL3')
depends=('gnuradio' 'boost' 'libsndfile' 'swig' 'cppunit' 'log4cpp' 'python2')
makedepends=('git' 'cmake' 'doxygen')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/argilo/gr-dsd.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    cmake . \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DPYTHON_EXECUTABLE=/usr/bin/python2
    make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
