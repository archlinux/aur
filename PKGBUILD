# Maintainer: Shreyansh Khajanchi <shreyansh_k@live.com>

_commit=39ce10133bc59497d7340a74f8b1a34988125691
pkgname=gnirehtet
pkgver=2.2
pkgrel=0
pkgdesc="Gnirehtet provides reverse tethering for Android"
arch=('x86_64')
url="https://github.com/Genymobile/gnirehtet"
license=('Apache-2.0')
depends=('android-tools')
makedepends=('rust')
source=(
	"https://github.com/Genymobile/${pkgname}/archive/${_commit}.tar.gz"
	"https://github.com/Genymobile/${pkgname}/releases/download/v${pkgver}/gnirehtet-rust-linux64-v${pkgver}.zip"
	"patch.diff"
)
sha256sums=(
	'37165e9af66db2adb062c006426061b69a4a6dd26fe16d2b05e00862b602c5a9'
	'46dc5e9be2d7c2be1805a518a853c454bb891bec18bab806b9b098ce36a78197'
	'SKIP'
)

prepare() {
	cp patch.diff "$srcdir/gnirehtet-${_commit}/relay-rust/src/"
	cd "$srcdir/gnirehtet-${_commit}/relay-rust/src/"
	patch -p0 -i patch.diff
}

build() {
	cd "$srcdir/gnirehtet-${_commit}/relay-rust"
	cargo build --release
}

package() {
	mkdir --parents "$pkgdir/usr/share/gnirehtet"
	cp "$srcdir/gnirehtet-rust-linux64/gnirehtet.apk" "$pkgdir/usr/share/gnirehtet"
	mkdir --parents "$pkgdir/usr/bin"
	cp "$srcdir/gnirehtet-${_commit}/relay-rust/target/release/gnirehtet" "$pkgdir/usr/bin"
}
