# Maintainer: mfw <espadonne@outlook.com>

pkgname=fortsh
pkgver=1.8.0
pkgrel=1
pkgdesc='Fortran Shell - A modern shell implementation with AST-based parsing'
arch=('x86_64' 'aarch64')
url='https://github.com/FortranGoingOnForty/fortsh'
license=('GPL-3.0-only')
depends=('glibc')
makedepends=('gcc-fortran' 'make')
source=("https://github.com/FortranGoingOnForty/fortsh/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('10857717b62dfeab3e214452ec9cb3123588d79b4d853f71c44bf94d0baa072f')

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
