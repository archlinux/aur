# Maintainer: VoidWalker-00 <voidwalker@github.com>
pkgname=litrpg-system-git
pkgver=r8.f1f28dc
pkgrel=1
pkgdesc="Terminal-based LITRPG character progression system with TUI and CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/VoidWalker-00/LITRPG_System"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo' 'git')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/LITRPG_System" "$pkgdir/usr/bin/litrpg"
}
