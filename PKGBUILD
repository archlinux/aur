# Maintainer: va2bbw <antelaurijssen@gmail.com>
pkgname=xara
pkgver=0.1.3
pkgrel=1
pkgdesc="A VARA-compatible HF/FM sound modem for Linux with a web UI"
arch=('x86_64' 'aarch64')
url="https://github.com/x0rro/xara"
license=('MIT')
depends=('alsa-lib' 'libpulse')
makedepends=('alsa-lib' 'cargo' 'pkgconf')

source=("$pkgname-$pkgver.tar.gz::https://github.com/x0rro/xara/archive/refs/tags/v$pkgver.tar.gz")

prepare() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

build() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo build --frozen --release --workspace
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 target/release/xara \
        "$pkgdir/usr/bin/xara"

    install -Dm755 target/release/xara-monitor \
        "$pkgdir/usr/bin/xara-monitor"

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
}

sha256sums=('a490afb1bb404d60d2ef0d071aa2c106511cfc2c5e99247b1b9347d8af53a54c')
