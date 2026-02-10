# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=oxicord
pkgver=0.1.8
pkgrel=2
pkgdesc='Vim-native Discord TUI for terminal enthusiasts'
arch=(x86_64)
url='https://github.com/linuxmobile/oxicord'
license=(GPL-3.0-only)
depends=(chafa dbus gcc-libs glibc)
makedepends=(cargo git)
options=(!lto)
source=("git+$url.git#tag=v$pkgver?signed")
validpgpkeys=('A3C75146365747E3B7D2FF57481EFFCF2C7B8C7B') # Braian A. Diez <bdiez19@gmail.com>
b2sums=('be7664e326df15b886fd90afa3f54b824f3746a54573887ab9af4bf072f8c695a6c1ff49c6e80a47b098793c3924d9169bfc1a6964d960c1b65f53b18590f1f3')

prepare() {
    cd oxicord
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd oxicord
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CARGO_PROFILE_RELEASE_DEBUG=true
    export CARGO_PROFILE_RELEASE_STRIP=none
    cargo build --frozen --release --all-features
}

check() {
    cd oxicord
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd oxicord
    install -Dm755 target/release/oxicord -t "$pkgdir/usr/bin"
}
