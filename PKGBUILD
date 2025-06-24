# Maintainer: Folke H. 'joru' Gleumes <folke-aur@gleumes.org>
pkgname=kickoff
pkgver=0.7.5
pkgrel=1
pkgdesc="A simple and uncomplicated program launcher for wayland"
makedepends=('cargo' 'cmake' 'freetype2' 'pkgconf' 'fontconfig' 'libxkbcommon')
arch=('x86_64')
url="https://github.com/j0ru/kickoff"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/j0ru/kickoff/archive/v$pkgver.tar.gz")
sha512sums=('1b4874a17b3eaa27bd7fd54be578a2f3b18f5c88bab79f4a5cc3efbd7d6f98530776f45973d6693a9f375dc26100f3ee3a2419bd78075342e29a43585253be4a')

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
