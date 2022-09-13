# Maintainer:   echo -n 'TWljaGFsIFMuIDxtaWNoYWxAdGFyLmJsYWNrPg==' | base64 -d
# Contributor:  echo -n 'TWljaGFsIFMuIDxtaWNoYWxAdGFyLmJsYWNrPg==' | base64 -d

pkgname=pa-rs-e
_pkgname=parse
pkgver=1.0.2
pkgrel=1
pkgdesc="A rusty password manager that'll blow your arse off"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/mchal_/$_pkgname"
license=('MIT')
source=("git+$url#tag=v$pkgver")
sha256sums=('SKIP')
makedepends=('cargo-nightly' 'git')

prepare() {
    cd "$srcdir/$_pkgname"
    export RUSTUP_TOOLCHAIN=nightly
    export CARGO_TARGET_DIR=target
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/$_pkgname"
    export RUSTUP_TOOLCHAIN=nightly
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$srcdir/$_pkgname"
    find target/release \
        -maxdepth 1 \
        -executable \
        -type f \
        -exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
}
