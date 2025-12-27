# Maintainer: Aleksandar KIRILOV <alexander.n.kirilov@gmail.com>

pkgname=wlout
pkgver=0.3.0
pkgrel=3
pkgdesc='Wayland (Wl Roots) Display Manager CLI with UNIX philosophy and modern goodies'
url='https://github.com/sashokbg/wlout'
license=(GPLv3)
makedepends=('cargo' 'git')
depends=()
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=(
    "git+https://github.com/sashokbg/wlout.git#tag=0.3.0"
)
b2sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

