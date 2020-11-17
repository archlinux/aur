# Maintainer: Ben Aaron Goldberg <ben@benaaron.dev>

pkgname=fre
pkgver=0.2.0
pkgrel=1
pkgdesc="CLI tool for tracking your most-used directories and files"
arch=('x86_64' 'i686' 'arm' 'armv7h' 'aarch64')
url="https://github.com/camdencheek/fre"
license=('MIT')
source=("https://github.com/camdencheek/fre/archive/v${pkgver}.tar.gz")
depends=('gcc-libs')
makedepends=('rust' 'cargo')
sha256sums=("fdca3786e35ced6b5709daaf987cad7a2776cc4aaf0d947b2f4185dc3384b5de")

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
