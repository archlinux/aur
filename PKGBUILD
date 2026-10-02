# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=rusty-rain
pkgver=0.5.0
pkgrel=1
pkgdesc="A cross platform matrix rain made with Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/cowboy8625/rusty-rain"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('704e430b5dd3e95cdbdca90956e8df79de8fa337c1e70c7f54028bd780da76e5')

prepare() {
	cd "rusty-rain-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "rusty-rain-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd "rusty-rain-$pkgver"
	install -Dm755 "target/release/rusty-rain" "$pkgdir/usr/bin/rusty-rain"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
