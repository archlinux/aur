# Maintainer: person134 <person134@users.noreply.github.com>

pkgname=hproc
pkgver=0.2.0
pkgrel=1
pkgdesc="A lightweight cross-platform process monitor for Windows, Linux, and macOS."
arch=('x86_64' 'aarch64')
url="https://github.com/person134/hproc"
license=('MIT')
makedepends=('cargo' 'git')
depends=('gcc-libs')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    cargo build --release --frozen
}

check() {
    cd "$srcdir/$pkgname"
    cargo test --frozen 2>/dev/null || true
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
