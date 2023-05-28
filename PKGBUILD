pkgname='sweep-rs-git'
pkgdesc='Sweep is a tool for interactive search through a list of entries.'
provides=('sweep-rs')
url='https://github.com/aslpavel/sweep-rs'
arch=('x86_64')
pkgrel=1
pkgver=r306.392555d
source=('sweep-rs::git+https://github.com/aslpavel/sweep-rs')
makedepends=(cargo)
sha1sums=('SKIP')
license=('MIT')

pkgver() {
    cd sweep-rs
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd sweep-rs
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

check() {
    cd sweep-rs
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

build() {
    cd sweep-rs
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd sweep-rs
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/sweep"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/sweep-rs/LICENSE"
}
