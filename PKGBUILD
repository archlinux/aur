# Maintainer: Jasper <j@sperp.dev>

pkgname=glimpse-git
pkgver=r66.1cb3747
pkgrel=1
pkgdesc="A simple GTK3 launcher/finder utility."
depends=('xdg-utils' 'gtk3' 'sqlite')
makedepends=('rust' 'cargo' 'git')
license=('GPL3')
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/jaspwr/glimpse"

source=("$pkgname::git+https://github.com/jaspwr/glimpse#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$pkgname"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release
}

package() {
    cd "$pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/glimpse"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/glimpse-indexer"
}
