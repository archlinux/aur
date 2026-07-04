# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=flerp
_pkgname=flerp
pkgver=r24.35c31c7
pkgrel=1
pkgdesc='A terminal UI for exploring and analyzing text files, PDFs, and images'
arch=(
    'x86_64'
    'aarch64'
    'riscv64'
    'armv7'
)
url='https://github.com/Huseynteymurzade28/flerp'
license=(
    'MIT'
)
makedepends=(
    'cargo'
    'git'
)
options=(
    # !lto
    !debug
)
provides=('flerp')
conflicts=('flerp-git')
source=("$_pkgname-main::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}-main"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "${_pkgname}-main"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${_pkgname}-main"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${_pkgname}-main"
    install -Dm0755 target/release/flerp "$pkgdir/usr/bin/flerp"
    # install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    # install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
