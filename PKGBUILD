# Maintainer: Jasper <j@sperp.dev>

pkgname=gpustat-git
pkgver=r13.4e19078
pkgrel=1
pkgdesc="GPU monitoring tool"
depends=()
makedepends=('rust' 'cargo' 'git')
license=('apache')
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/arduano/gpustat"

source=("$pkgname::git+https://github.com/arduano/gpustat#branch=master")
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
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/gpustat"
}
