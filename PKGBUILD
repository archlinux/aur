# Contributor: Eray Erdin <eraygezer.94@gmail.com>

pkgname='tgcli'
_pkgver=0.6.0-alpha.1
pkgver="${_pkgver/-/.}"
pkgrel=1
pkgdesc='A terminal client for Telegram.'
arch=('x86_64')
url="https://github.com/erayerdin/tgcli"
license=('MPL-2.0')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$_pkgver.tar.gz")
sha512sums=('a78b8c954cb12fe7e7cc4134def7062d5b8f8530033958e1dc0068f87ddcebe06086f4650aaa37533e1d2bc2f7e184c20719ddcce0949a5e10bc7a4761dfc69c')

prepare() {
    cd "$pkgname-$_pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$_pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$_pkgver"
    install -Dm755 -t "$pkgdir/usr/bin" target/release/tgcli
}

# vim: set ts=4 sw=4 et:
