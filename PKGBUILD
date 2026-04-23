# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=rdn-git
_pkgname=rdn
pkgver=r9.2c8c340
pkgrel=1
pkgdesc='Rusty Dos Navigator'
arch=('x86_64')
url='https://github.com/apatrushev/rdn'
license=('MIT')
makedepends=('cargo')
options=(!lto)
provides=('rdn')
conflicts=('rdn')
source=("$_pkgname::git+$url.git#branch=main")
sha256sums=(SKIP)

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

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
    install -Dm0755 'target/release/rdn' "$pkgdir/usr/bin/rdn"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

# vim: ts=4 sw=4 et:
