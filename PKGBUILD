# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>FiTui=fitui
pkgname=termcraft-git
_pkgname=termcraft
pkgver=0.1.0.r5.gafb8802
pkgrel=1
pkgdesc='Terminal-only 2D sandbox survival in Rust.'
arch=('x86_64' 'aarch64')
url='https://github.com/pagel-s/termcraft'
license=('AGPL-3.0')
makedepends=('cargo' 'git')
provides=('termcraft')
conflicts=('termcraft')
source=("$_pkgname::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
    install -Dm0755 'target/release/termcraft' "${pkgdir}"/usr/bin/termcraft
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
