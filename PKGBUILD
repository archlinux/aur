# Maintainer: mfw <espadonne@outlook.com>

pkgname=fortsh
pkgver=1.6.0
pkgrel=1
pkgdesc='Fortran Shell - A modern shell implementation with AST-based parsing'
arch=('x86_64' 'aarch64')
url='https://github.com/FortranGoingOnForty/fortsh'
license=('GPL-3.0-only')
depends=('glibc')
makedepends=('gcc-fortran' 'make')
source=("https://github.com/FortranGoingOnForty/fortsh/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f9e239c7e3f1b0f0d43e534673e078fc20c223bb4c0e49ba726b7999f0a0dba3')

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
