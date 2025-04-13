# Maintainer: TTsdzb <ttsdzboutlook dot com>
# Maintainer: Jia Yin<lok-ation at outlook dot com>

pkgname=uni-updater
pkgver=0.2.3
pkgrel=3
pkgdesc='Helper program that updates everything on your system.'
arch=('x86_64')
url="https://codeberg.org/TTsdzb/uni-updater"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://codeberg.org/TTsdzb/uni-updater/archive/4f7005e82ca6e736ad7933798c1964dcf7398626.tar.gz"
	)
sha512sums=('3da976f6c89a71dce8166750a038de849804d209967ae85a13f2f7423bbe04f2f0d48b96c670cba31672a13173457db459f4513e483bfb9974fcdc23b32d37df')
prepare() {
	cd "$pkgbase"
	cargo update
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$pkgbase"
	cargo build --release --frozen --all-features
}

package() {
	cd "$pkgbase"
	install -Dm755 -t "$pkgdir/usr/bin" target/release/uni-updater
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
