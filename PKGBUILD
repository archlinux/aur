# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=strace-tui-git
_pkgname=strace-tui
pkgver=1.2.0.beta.2.r5.g71c6ffb
pkgrel=1
pkgdesc=' A terminal user interface (TUI) for visualizing and exploring strace output'
arch=('x86_64' 'aarch64')
url='https://github.com/Rodrigodd/strace-tui'
license=('MIT' 'APACHE')
makedepends=('cargo' 'git')
provides=('strace-tui')
source=("$_pkgname::git+$url.git#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$_pkgname"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$_pkgname"
    install -Dm0755 'target/release/strace-tui' "$pkgdir/usr/bin/strace-tui"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-MIT
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-APACHE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
