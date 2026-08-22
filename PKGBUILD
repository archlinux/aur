# Maintainer: Andrés J. Díaz <ajdiaz@ajdiaz.me>
# Contributor: Andrés J. Díaz <ajdiaz@ajdiaz.me>

pkgname=fem
pkgver=0.1.0
pkgrel=1
pkgdesc='CLI-based email management (IMAP + SMTP)'
arch=('x86_64' 'aarch64')
url='https://github.com/ajdiaz/fem'
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ajdiaz/fem/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('15274065f49a43e5189390850e7854f83431e8f685f8074b159efef31e5cbde7')

build() {
    cd "$srcdir/fem-$pkgver"
    cargo build --release --locked
}

check() {
    cd "$srcdir/fem-$pkgver"
    cargo test --release --locked --all-targets --all-features
}

package() {
    cd "$srcdir/fem-$pkgver"
    install -Dm755 "target/release/fem" "$pkgdir/usr/bin/fem"
    install -Dm644 "man/fem.1" "$pkgdir/usr/share/man/man1/fem.1"
    install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
sha256sums=('15274065f49a43e5189390850e7854f83431e8f685f8074b159efef31e5cbde7')
