# Maintainer: Alessandro Maestri <umpire274@gmail.com>
pkgname=librius
pkgver=0.2.1
pkgrel=1
pkgdesc="A fast, minimalist CLI to manage your personal book collection — built in Rust."
arch=('x86_64')
url="https://github.com/umpire274/librius"
license=('MIT')
depends=('sqlite')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('beab9fd46a5c020ba539833820a7299db50a3087b2de75979247eb6b5f893e7b')

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

