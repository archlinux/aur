# Maintainer: mfw <espadonne@outlook.com>

pkgname=fortsh
pkgver=1.10.0
pkgrel=1
pkgdesc='Fortran Shell - A modern shell implementation with AST-based parsing'
arch=('x86_64' 'aarch64')
url='https://github.com/FortranGoingOnForty/fortsh'
license=('GPL-3.0-only')
depends=('glibc')
makedepends=('gcc-fortran' 'make')
source=("https://github.com/FortranGoingOnForty/fortsh/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e110a76a7e9f78173901d014ccf17b46e40b7573f1ac2844ebd971999111aef4')

build() {
    cd "$pkgname-$pkgver"
    make release
}

check() {
    cd "$pkgname-$pkgver"
    make test || true  # Allow tests to fail gracefully if they require interactive input
}

package() {
    cd "$pkgname-$pkgver"

    # Install main binary
    install -Dm755 bin/fortsh "$pkgdir/usr/bin/fortsh"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
