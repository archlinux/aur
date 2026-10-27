# Maintainer: Ante Laurijssen <va2bbw@gmail.com>
pkgname=xara
pkgver=0.1.1
pkgrel=2
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
sha256sums=('26a52ce2a7f5107ed63ea956432c6d4009965a5603cf47ee76c9a33bbc3a96d2')
