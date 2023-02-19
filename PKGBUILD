# Maintainer: Folke H. 'joru' Gleumes <folke-aur@gleumes.org>
pkgname=kickoff
pkgver=0.7.0
pkgrel=1
pkgdesc="A simple and uncomplicated program launcher for wayland"
makedepends=('cargo' 'cmake' 'freetype2' 'pkgconf')
arch=('x86_64')
url="https://github.com/j0ru/kickoff"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/j0ru/kickoff/archive/v$pkgver.tar.gz")
sha512sums=('b7c79c415b45d6ac3370139c47be1cd87fda09b8b4190a73342f08a7588d0aad8eb4f5704da5a9d0c7c09f6ef58b652954f63cf181659354c8ec9ac2c451b77c')

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
