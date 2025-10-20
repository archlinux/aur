# Maintainer: Alessandro Maestri <umpire274@gmail.com>
pkgname=librius
pkgver=0.4.0
pkgrel=1
pkgdesc="A fast, minimalist CLI to manage your personal book collection — built in Rust."
arch=('x86_64')
url="https://github.com/umpire274/librius"
license=('MIT')
depends=('sqlite')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('32a27d8347b865a46d68e75ea4efbe37121e47b00e48ea17e428be8408512fdf')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --locked
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo test --release --locked
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Binary
    install -Dm755 "target/release/librius" "$pkgdir/usr/bin/librius"

    # Documentation
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "CHANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"

    # License
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

