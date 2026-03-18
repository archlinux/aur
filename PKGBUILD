# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=purple-git
_pkgname=purple
pkgver=2.3.0
pkgrel=1
pkgdesc='TUI to search, connect and manage SSH servers. Visual file transfer, cloud sync (10 providers), password management. Edits ~/.ssh/config directly.'
arch=('x86_64' 'aarch64' 'armv7h' 'riscv64')
url='https://github.com/erickochen/purple'
license=('MIT')
depends=('openssh')
makedepends=('cargo' 'git')
options=(!lto)
provides=('purple')
conflicts=('purple' 'purple-bin')
source=("$_pkgname::git+$url.git#branch=master")
sha256sums=('SKIP')

prepare() {
    cd "$_pkgname"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$_pkgname"
    install -Dm0755 -t ${pkgdir}/usr/bin 'target/release/purple'
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
