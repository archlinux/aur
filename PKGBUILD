# Maintainer: Folke H. 'joru' Gleumes <folke-aur@gleumes.org>
pkgname=kickoff
pkgver=0.7.3
_pkgver=a27ab23c032561de7457692fe88d8dd25967c0a7
pkgrel=2
pkgdesc="A simple and uncomplicated program launcher for wayland"
makedepends=('cargo' 'cmake' 'freetype2' 'pkgconf' 'fontconfig' 'libxkbcommon')
arch=('x86_64')
url="https://github.com/j0ru/kickoff"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/j0ru/kickoff/archive/$_pkgver.tar.gz")
sha512sums=('a8fa064e79273edb9df41836a0cb5a17d816d166d3e73485c1f97aa2a0e90aebc8350dc667c0fcf8b9d93f5f87e3629c1bf61ddb30ff25b87e2c141a1b365ce3')

export RUSTUP_TOOLCHAIN=stable CARGO_PROFILE_RELEASE_LTO=true

prepare() {
	cd "$pkgname-$_pkgver"
	cargo fetch --locked --target x86_64-unknown-linux-gnu	
}

build() {
	cd "$pkgname-$_pkgver"
	cargo build --release --frozen --all-features --target-dir=target
}

package() {
	cd "$pkgname-$_pkgver"
	install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}
