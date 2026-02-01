# Maintainer: Fernando Carmona Varo <ferkiwi @t gmail dot com>
# Contributor: Ben Aaron Goldberg <ben@benaaron.dev>

pkgname=fre
pkgver=0.4.1
pkgrel=1
pkgdesc="CLI tool for tracking your most-used directories and files"
arch=('x86_64' 'i686' 'arm' 'armv7h' 'aarch64')
url="https://github.com/camdencheek/fre"
license=('MIT')
source=("https://github.com/camdencheek/fre/archive/refs/tags/v${pkgver}.tar.gz")
depends=('gcc-libs')
makedepends=('rust' 'cargo')
sha256sums=('dab1da46e8e2dc581c0812c6160893a962fb677dfebe773ba333fd28b98e818b')

build() {
    tar -xf v${pkgver}.tar.gz
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo test
}

package() {
    install -D -m755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -D -m644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
