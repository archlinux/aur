# Maintainer: Roy Oursler <roy.j.oursler@intel.com>
pkgname=isa-l
pkgver=2.31.0
pkgrel=1
pkgdesc="A collection of optimized low-level functions targeting storage applications"
arch=(x86_64)
url="https://github.com/intel/$pkgname"
license=('BSD')
makedepends=('nasm' 'patchelf')
source=("$url/archive/v$pkgver.tar.gz")
sha1sums=('b0a02f9c3b35407bbf0d32afe8950e4b6d75cf70')

build() {
    cd "${srcdir}/$pkgname-$pkgver"
    ./autogen.sh
    ./configure --prefix="${pkgdir}/usr" -q

    make
}

check() {
    cd "${srcdir}/$pkgname-$pkgver"
    make check
}

package() {
    cd "${srcdir}/$pkgname-$pkgver"
    make install
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    patchelf --remove-rpath $pkgdir/usr/bin/igzip
}
