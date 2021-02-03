# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=ludusavi
pkgver=0.9.0
pkgrel=3
pkgdesc="Backup tool for PC game saves"
arch=('x86_64')
url="https://github.com/mtkennerly/ludusavi"
license=('MIT')
depends=('gcc-libs' 'libxcb' 'fontconfig')
makedepends=('git' 'rust' 'libx11')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$url/releases/download/v$pkgver/$pkgname-v$pkgver-legal.txt"
        "$pkgname.desktop")
sha256sums=('cd86eefea8f75c3b80e27fadc6d5dccad47c501ad0914b8e1ebe625813dffb6b'
            '09f08dc24ebe6800243586a6ac546bfdeb1b6a70d1f27a3e89c6d185b263e4a4'
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
