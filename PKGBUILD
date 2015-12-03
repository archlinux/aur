# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=gr-dab-git
pkgver=r199.6856a8b
pkgrel=1
pkgdesc="GNU Radio DAB (digital audio broadcasting) module"
arch=('i686' 'x86_64')
url="https://github.com/andrmuel/gr-dab"
license=('GPL3')
depends=('gnuradio' 'boost' 'swig' 'cppunit' 'python2')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/andrmuel/gr-dab.git')
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
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DENABLE_DOXYGEN=OFF
    make
}

package() {
    cd "$srcdir/${pkgname%-git}"
    make DESTDIR="$pkgdir/" install
}
