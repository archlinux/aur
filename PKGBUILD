# Maintainer: Dawid Potocki <archlinux a dawidpotocki , com>

pkgname=wayfreeze
pkgver=0.2.1
pkgrel=1
pkgdesc='Tool to freeze the screen of a Wayland compositor'
arch=('x86_64')
url='https://github.com/Jappie3/wayfreeze'
license=('AGPL-3.0-only')
depends=('glibc' 'libgcc' 'libxkbcommon' 'wayland')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Jappie3/wayfreeze/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('d9a1e255758cca00510950690d483db01630c1ef42a718a537ffaee7180e0dc9835a1cc8c010e5a5ffac5fd7eea1beb7f3f86579871fe71d7d9e26c58dfeacd7')

prepare() {
	cd "${pkgname}-${pkgver}"

	export RUSTUP_TOOLCHAIN="stable"
	cargo fetch --locked --target host-tuple
}

build() {
	cd "${pkgname}-${pkgver}"

	export RUSTUP_TOOLCHAIN="stable"
	export CARGO_TARGET_DIR="target"
	cargo build --frozen --release --all-features
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
}
