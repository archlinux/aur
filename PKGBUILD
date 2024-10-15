# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=librespot-auth
pkgver=0.1.1
pkgrel=1
pkgdesc="A simple program for populating a credentials.json via Spotify's zeroconf authentication."
arch=('x86_64')
url="https://github.com/dspearson/librespot-auth"
license=('ISC')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ee333c75ba8c9e1f00564a3470a48e64fadc658e2deb1b6a035b13420c2b5df3')

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

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 target/release/${pkgname} "$pkgdir/usr/bin/${pkgname}"
	install -Dm644 LICENCE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
