# Maintainer: Shreyansh Khajanchi <shreyansh_k@live.com>

pkgname=gnirehtet
pkgver=2.4
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
	'5ff179fca58e85473e737680a72aeb84c710082283bfe9cce4b044b3c2436c4d'
	'b5df9c20327ab96edc95a3336fdb65c2b03b01828b98eb18c33efa65bbb06f2f'
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
