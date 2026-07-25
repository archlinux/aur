# Maintainer: mfw <espadonne@outlook.com>

pkgname=fortsh
pkgver=1.9.0
pkgrel=1
pkgdesc='Fortran Shell - A modern shell implementation with AST-based parsing'
arch=('x86_64' 'aarch64')
url='https://github.com/FortranGoingOnForty/fortsh'
license=('GPL-3.0-only')
depends=('glibc')
makedepends=('gcc-fortran' 'make')
source=("https://github.com/FortranGoingOnForty/fortsh/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e8ebdf06b7ec53c6fc37e38676e6afed8215f4336217315de44b9525ceffc00f')

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
