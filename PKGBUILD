# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=ludusavi
pkgver=0.10.0
pkgrel=1
pkgdesc="Backup tool for PC game saves"
arch=('x86_64')
url="https://github.com/mtkennerly/ludusavi"
license=('MIT')
depends=('gcc-libs' 'libxcb' 'fontconfig')
makedepends=('git' 'rust' 'libx11')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$url/releases/download/v$pkgver/$pkgname-v$pkgver-legal.txt"
        "$pkgname.desktop")
sha256sums=('e525ea9f3545d30b0c81dc4e7cf3c677d7340e3045ef18a9239aa3c44069882b'
            '75f6130f1ebec215d27807ac05211cfc849b912fd870218f3c65d1d44e709d58'
            '9f9abd3a3ea78c1094c52a80d65c7d4bc59ffc0f67ee06ab07de373e6f769edb')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked --all-features --target-dir=target
}

check() {
	cd "$pkgname-$pkgver"
	cargo test --release --locked --target-dir=target
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 assets/icon.png \
		"$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname.png"
	install -Dm644 assets/icon.svg \
		"$pkgdir/usr/share/icons/scalable/apps/$pkgname.svg"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "$srcdir/$pkgname-v$pkgver-legal.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/legal.txt"
	install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
}
