pkgname=fast-systemctl
pkgver=1.2.0
pkgrel=1
pkgdesc="simplify common systemctl commands"
arch=('x86_64')
url="https://github.com/CaSilicate-dev/fast_systemctl"
license=('CC0')
depends=()
options=(!debug)
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b5ac18036f0c4cd57f4c20d1ba70c7b835315e08b6af5d4af2577dbe1fd85da4')

_realname=fast_systemctl

prepare() {
    cd "$srcdir/${_realname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/${_realname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/${_realname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/${_realname}-${pkgver}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/sc"
}
