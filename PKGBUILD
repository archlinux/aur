# Maintainer: va2bbw <antelaurijssen@gmail.com>
pkgname=xara
pkgver=0.1.2
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
sha256sums=('f4d0808fca912d15a93ff1eb9b1f4fe276c43858683f195ed33520714f93f93d')
