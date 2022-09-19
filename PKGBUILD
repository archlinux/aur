# Maintainer: Mufeed Ali <lastweakness@tuta.io>
# Maintainer: Salamandar <salamandar@salamandar.fr>

pkgname=keepass-diff
_author=Narigo
_gitname=keepass-diff
pkgver=1.1.3
pkgrel=1
pkgdesc='Tool to find diff between KeePass (*.kdbx) files'
arch=(any)
url=https://github.com/Narigo/keepass-diff
license=(MIT)
makedepends=(
    cargo
)
source=(
    "$_gitname-v$pkgver.tar.gz::https://github.com/$_author/$_gitname/archive/$pkgver.tar.gz"
)
sha256sums=(
    '4ddf872f126ee74cc4b44f7b6aabe516da9a4c0dee1466110ca9acec04079325'
)

prepare() {
    cd "$_gitname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_gitname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --locked --all-features
}

check() {
    cd "$_gitname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$_gitname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin" "target/release/keepass-diff"
    install -Dm0644 -t "$pkgdir/usr/share/doc/${pkgname}" "README.md"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/${pkgname}" "LICENSE"
}
