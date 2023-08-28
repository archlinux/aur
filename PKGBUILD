# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Maintainer: Callum Andrew <contact@candrew.net>

pkgname=shotman
pkgver=0.4.5
pkgrel=2
pkgdesc="Uncompromising screenshot GUI for Wayland"
arch=("x86_64" "aarch64")
url="https://git.sr.ht/~whynothugo/shotman"
license=('ISC')
depends=("libxkbcommon")
optdepends=(
    "sway: screenshots of a single window on swaywm"
    "slurp: screenshots of a region on swaywm"
)
makedepends=("cargo" "scdoc")
source=("shotman-v$pkgver.tar.gz::https://git.sr.ht/~whynothugo/shotman/archive/v$pkgver.tar.gz")
sha512sums=("8f63d8acaade3f2d4bb36911cbf5776cddb23f3ceacfee4adc7344fe648b0fe80cbee019f25c112004b46473419526170c54c587b9c57368d46b08e0aefea6dd")

prepare() {
    cd "$srcdir/$pkgname-v$pkgver"

    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/$pkgname-v$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    make build
}

check() {
    cd "$srcdir/$pkgname-v$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/$pkgname-v$pkgver"

    DESTDIR="$pkgdir" PREFIX="/usr" make install --trace
}
