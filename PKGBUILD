# Maintainer: Ante Laurijssen <va2bbw@gmail.com>

pkgname=xara
pkgver=0.1.1
pkgrel=1
pkgdesc="A VARA-compatible HF/FM sound modem for Linux with a web UI"
arch=('x86_64' 'aarch64')
url="https://github.com/x0rro/xara"
license=('MIT')
depends=('alsa-lib' 'glibc' 'libpulse')
makedepends=('cargo' 'git')
source=("$pkgname::git+https://github.com/x0rro/xara.git#tag=v$pkgver")

prepare() {
    cd "$pkgname"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

build() {
    cd "$pkgname"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --frozen --release --workspace
}

package() {
    cd "$pkgname"

    install -Dm755 target/release/xara \
        "$pkgdir/usr/bin/xara"

    install -Dm755 target/release/xara-monitor \
        "$pkgdir/usr/bin/xara-monitor"

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('f91b3de833cfa89e1bd544c87c713fc7c5903efa108b1f388fb0361890adc6d1')
