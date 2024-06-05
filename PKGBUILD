# Maintainer: Folke H. 'joru' Gleumes <folke-aur@gleumes.org>
pkgname=kickoff
pkgver=0.7.3
pkgrel=1
pkgdesc="A simple and uncomplicated program launcher for wayland"
makedepends=('cargo' 'cmake' 'freetype2' 'pkgconf' 'fontconfig' 'libxkbcommon')
arch=('x86_64')
url="https://github.com/j0ru/kickoff"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/j0ru/kickoff/archive/v$pkgver.tar.gz")
sha512sums=('8bcd6116fa882022fe09025da79a786c95b4fe922d2f88435998ff9be756029cd6ad8c85e75e1fab0cc46bce2f9e5885e39290afc798aefac97d5ecf7391b107')

export RUSTUP_TOOLCHAIN=stable CARGO_PROFILE_RELEASE_LTO=true

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target x86_64-unknown-linux-gnu	
}

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --frozen --all-features --target-dir=target
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}
