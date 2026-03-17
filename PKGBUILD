# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>FiTui=fitui
pkgname=image-auditor
pkgver=0.2.3
pkgrel=1
pkgdesc='TUI that finds & AI-fixes Lighthouse image issues (CLS, lazy loading, WebP, srcset) across your entire codebase in seconds.'
arch=('x86_64' 'aarch64')
url='https://github.com/0franco/image-auditor'
license=('MIT')
makedepends=('cargo')
options=(!lto)
provides=('image-auditor')
conflicts=('image-auditor-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('52bcc4ac0b8ab0245e486188e2dd7f23cde7fb9a09096478f6b19d1b9c7223ee')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 'target/release/image-auditor' "${pkgdir}"/usr/bin/image-auditor
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
