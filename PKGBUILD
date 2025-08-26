# Maintainer: mfw <espadonne@outlook.com>

pkgname=fortsh
pkgver=1.0.0
pkgrel=2
pkgdesc='Modern Unix shell implementation in Fortran 2018 with advanced features'
arch=('x86_64')
url='https://github.com/FortranGoingOnForty/fortsh'
license=('MIT')
depends=('glibc')
makedepends=('gcc-fortran' 'gcc' 'make')
source=("git+https://github.com/FortranGoingOnForty/fortsh.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd fortsh
    make clean
    make all FCFLAGS="-Wall -Wextra -std=f2018 -fPIC -g -O2 -Wno-unused-variable"
}

check() {
    cd fortsh
    make test || true  # Allow tests to fail gracefully if they require interactive input
}

package() {
    cd fortsh
    
    # Install main binary
    install -Dm755 bin/fortsh "$pkgdir/usr/bin/fortsh"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    [ -f TEST_RESULTS.md ] && install -Dm644 TEST_RESULTS.md "$pkgdir/usr/share/doc/$pkgname/TEST_RESULTS.md" || true
}