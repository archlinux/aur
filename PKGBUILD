# Maintainer: sublipri <sublipri at proton dot me>
pkgname=subar
pkgver=0.1.0
pkgrel=1
pkgdesc="A basic status bar for sway/i3wm"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/sublipri/subar"
license=('GPL-3.0-only')
optdepends=('wireplumber' 'mpd' 'bom-buddy')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sublipri/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('ae092331fe4b6c95e4faee6e1cd903dbcbfebad18502424a0666afd0f9e0fe1b')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
