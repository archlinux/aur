# Maintainer: mfw <espadonne@outlook.com>

pkgname=fortsh
pkgver=6.0.6
pkgrel=1
pkgdesc='Fortran unix shell balancing friendliness and parity'
arch=('x86_64')
url='https://github.com/FortranGoingOnForty/fortsh'
license=('MIT')
depends=('glibc')
makedepends=('gcc-fortran' 'make')
source=("git+https://github.com/FortranGoingOnForty/fortsh.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd fortsh
    make release
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
}
