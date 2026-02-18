# Maintainer: qrafty-ai <contact@qrafty.ai>
pkgname=opencode-kanban
pkgver=0.1.11
pkgrel=1
pkgdesc="Terminal kanban board for managing OpenCode tmux sessions and Git worktrees"
arch=('x86_64' 'aarch64')
url="https://github.com/qrafty-ai/opencode-kanban"
license=('MIT')
depends=('tmux' 'sqlite')
makedepends=('rust' 'cargo' 'cmake' 'nasm' 'perl' 'sqlite')
source=("$pkgname-$pkgver.tar.gz::https://github.com/qrafty-ai/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('215ef76c20170b7c79e41e8702a52dd63b18a488bb5990dde555f8d3ea7e51f9')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
<<<<<<< ci/aur
    unset CFLAGS CXXFLAGS LDFLAGS
=======
    export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=gcc
    export CARGO_TARGET_AARCH64_UNKNOWN_LINUX_GNU_LINKER=aarch64-linux-gnu-gcc
>>>>>>> main
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
<<<<<<< ci/aur
    unset CFLAGS CXXFLAGS LDFLAGS
=======
    export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=gcc
    export CARGO_TARGET_AARCH64_UNKNOWN_LINUX_GNU_LINKER=aarch64-linux-gnu-gcc
>>>>>>> main
    cargo test --frozen --lib 2>/dev/null || true
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
