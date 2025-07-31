# Maintainer: Dylan <dylanh@aur.archlinux.org>
pkgname=rune-editor
pkgver=0.2.1
pkgrel=2
pkgdesc="A modern CLI text editor that bridges the gap between nano's simplicity and advanced features"
arch=('x86_64')
url="https://github.com/exec/rune"
license=('MIT')
depends=('oniguruma')
makedepends=('rust' 'cargo')
provides=('rune')
conflicts=('rune-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/exec/rune/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('70e0ad45846d2d63dab4ecdecfc865c4a49b957c6aaa2a7316303ac7e5da8c3b')

build() {
    cd "rune-$pkgver"
    cargo build --release --locked
}

check() {
    cd "rune-$pkgver"
    cargo test --release --locked
}

package() {
    cd "rune-$pkgver"
    install -Dm755 target/release/rune "$pkgdir/usr/bin/rune"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}