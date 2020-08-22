# Maintainer: Shreyansh Khajanchi <shreyansh_k@live.com>

pkgname=gnirehtet
pkgver=2.5
pkgrel=0
pkgdesc="Gnirehtet provides reverse tethering for Android"
arch=('x86_64')
url="https://github.com/Genymobile/gnirehtet"
license=('Apache-2.0')
depends=('android-tools')
makedepends=('rust' 'patch')
source=(
	"https://github.com/Genymobile/${pkgname}/archive/v${pkgver}.tar.gz"
	"https://github.com/Genymobile/${pkgname}/releases/download/v${pkgver}/gnirehtet-rust-linux64-v${pkgver}.zip"
	"patch.diff"
)
sha256sums=(
	'2b55b56e1b21d1b609a0899fe85d1f311120bb12b04761ec586187338daf6ec5'
	'2b1ce04540e8de5df5ddbebb64bb01e27c13d556b3a04a8563dcce3786765705'
	'SKIP'
)

prepare() {
	cp patch.diff "$srcdir/gnirehtet-${pkgver}/relay-rust/src/"
	cd "$srcdir/gnirehtet-${pkgver}/relay-rust/src/"
	patch -p0 -i patch.diff
}

build() {
	cd "$srcdir/gnirehtet-${pkgver}/relay-rust"
	cargo build --release
}

package() {
	mkdir --parents "$pkgdir/usr/share/gnirehtet"
	cp "$srcdir/gnirehtet-rust-linux64/gnirehtet.apk" "$pkgdir/usr/share/gnirehtet"
	mkdir --parents "$pkgdir/usr/bin"
	cp "$srcdir/gnirehtet-${pkgver}/relay-rust/target/release/gnirehtet" "$pkgdir/usr/bin"
}
