# Maintainer: Jeena <hello@jeena.net>

pkgname=feedthemonkey
pkgver=3.0.1
pkgrel=1
pkgdesc="Desktop client for FreshRSS, Miniflux and other servers implementing the Greader API"
arch=('x86_64')
url="https://git.jeena.net/jeena/FeedTheMonkey"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'webkitgtk-6.0' 'libsecret' 'glib2' 'hicolor-icon-theme')
makedepends=('cargo' 'blueprint-compiler' 'git')
options=(!lto)
source=("$pkgname::git+https://git.jeena.net/jeena/FeedTheMonkey.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo build --release --locked
}

package() {
	cd "$pkgname"
	install -Dm755 target/release/feedthemonkey "$pkgdir/usr/bin/feedthemonkey"
	install -Dm644 data/net.jeena.FeedTheMonkey.desktop \
		"$pkgdir/usr/share/applications/net.jeena.FeedTheMonkey.desktop"
	install -Dm644 data/icons/net.jeena.FeedTheMonkey.png \
		"$pkgdir/usr/share/icons/hicolor/256x256/apps/net.jeena.FeedTheMonkey.png"
	install -Dm644 data/net.jeena.FeedTheMonkey.gschema.xml \
		"$pkgdir/usr/share/glib-2.0/schemas/net.jeena.FeedTheMonkey.gschema.xml"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}