# Maintainer: Shreyansh Khajanchi <shreyansh_k@live.com>

pkgname=gnirehtet
pkgver=2.5.1
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
	'0d41361b9ac8b3b7fa4f4a0aff933472a72886556bd3fc4659be299b546274e6'
	'dee55499ca4fef00ce2559c767d2d8130163736d43fdbce753e923e75309c275'
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
