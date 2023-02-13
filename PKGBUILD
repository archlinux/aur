# Maintainer: Folke H. 'joru' Gleumes <folke-aur@gleumes.org>
pkgname=kickoff
pkgver=0.6.1
pkgrel=1
pkgdesc="A simple and uncomplicated program launcher for wayland"
makedepends=('cargo' 'cmake' 'freetype2' 'pkgconf')
arch=('x86_64')
url="https://github.com/j0ru/kickoff"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/j0ru/kickoff/archive/v$pkgver.tar.gz")
sha512sums=('1d02d0b6d9d2cb1bdf7c74747ea1f44655278f497bb207af98c73ffd858d9cebb6cb59d8bca7e6dcfa39cca456279b9382f98d59217af6d45e3940c8142b03cd')

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
