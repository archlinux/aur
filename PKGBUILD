# Maintainer: Phusit Somboonyingsuk

pkgname=mprisence
pkgver=1.2.3
pkgrel=1
pkgdesc="Discord Rich Presence for MPRIS media players"
arch=("x86_64")
url="https://github.com/lazykern/mprisence"
license=("MIT")
depends=("gcc-libs")
makedepends=("cargo")
conflicts=("mprisence-git")
install=mprisence.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz"
        "mprisence.install")
sha256sums=('SKIP'
            'SKIP')

prepare() {
    cd "$srcdir/$pkgname-${pkgver}"
    cargo fetch --locked
}

build() {
    cd "$srcdir/$pkgname-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$srcdir/$pkgname-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd "$srcdir/$pkgname-${pkgver}"
    make DESTDIR="$pkgdir" pkg-prepare
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/mprisence.install" "$pkgdir/usr/share/pacman/hooks/mprisence.hook"
} 
