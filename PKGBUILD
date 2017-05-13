# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: TingPing <tingping@tingping.se>
# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgbase=brotli
pkgname=('brotli' 'python-brotli' 'python2-brotli')
pkgver=0.6.0
pkgrel=1
pkgdesc='Brotli compression library'
arch=('i686' 'x86_64')
license=('MIT')
url='https://github.com/google/brotli'
depends=('gcc-libs')
makedepends=('cmake' 'python' 'python2')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/google/$pkgbase/archive/v$pkgver.tar.gz")
sha256sums=('69cdbdf5709051dd086a2f020f5abf9e32519eafe0ad6be820c667c3a9c9ee0f')

build() {
    cd "$pkgbase-$pkgver"
    python ./setup.py build
    python2 ./setup.py build

    mkdir -p build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_INSTALL_LIBDIR="/usr/lib"
    make
}

check() {
    cd "$pkgbase-$pkgver"
    make test
}

package_brotli() {
    cd "$pkgbase-$pkgver/build"
    make DESTDIR="$pkgdir" install
    install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-brotli() {
    depends=('python')

    cd "$pkgbase-$pkgver"

    python ./setup.py install --skip-build --root="$pkgdir/"
}

package_python2-brotli() {
    depends=('python2')

    cd "$pkgbase-$pkgver"

    python2 ./setup.py install --skip-build --root="$pkgdir/"
}
