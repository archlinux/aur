# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
pkgname=divine
pkgver=3.3.2
pkgrel=1
pkgdesc='Explicit-state model checker'
arch=('i686' 'x86_64')
url='http://divine.fi.muni.cz'
license=('custom:bsd3')
depends=('llvm' 'llvm-libs' 'openmpi')
makedepends=('cmake' 'flex' 'byacc')
optdepends=('clang: for building LLVM bitcode'
            'qt4: for GUI capabilities'
            'boost: for verification of UPPAAL timed automata'
            'boost-libs: for verification of UPPAAL timed automata'
            'libxml2: for verification of UPPAAL timed automata')
source=("http://divine.fi.muni.cz/download/divine-${pkgver}.tar.gz")
sha256sums=('704dcda1c8fb0da9789468a89bb6e50f293460fe50ff82c0fe065a03a5e639fe')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make distclean
    ./configure -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="${pkgdir}" install
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set et sw=4 sts=4 et:
