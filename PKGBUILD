# Maintainer: Juliandev02 <julian@strawberryfoundations.org>

pkgname=bitshrinker
pkgver=1.0.0
pkgrel=2
pkgdesc="Desktop GUI app for compressing videos and images to a target file size"
arch=('x86_64' 'aarch64')
url="https://github.com/Strawberry-Foundations/bitshrinker"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'ffmpeg')
makedepends=('cargo' 'rust')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('403e23e071ba1e3a6089bf9b3e0e3a94d9966d61f137033e788fb33e5faf6ee3')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	cargo build --release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 "assets/image/icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm644 "bitshrinker.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
