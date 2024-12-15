# Maintainer: Emily Ellis <emily@scgtrp.net>
pkgname=tangara-companion
pkgver=0.4.3
pkgrel=1
pkgdesc="Companion app for Cool Tech Zone Tangara"
depends=('glib2' 'gtk4' 'libadwaita')
makedepends=('cargo')
arch=(x86_64)
url="https://github.com/haileys/tangara-companion"
license=('GPL-3.0')
source=("https://github.com/haileys/tangara-companion/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('9ae340186d0e7e49a77f0ab533be694c3e9069e78a924468e6130797d4f8149ff118159660a59c3c0a9afb1529fb2b76d9ccf7ca76066755866c35a5a0c5c287')

prepare() {
	cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
	cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
