# Maintainer: Juliandev02 <julian@strawberryfoundations.org>

pkgname=bitshrinker
pkgver=1.0.0
pkgrel=1
pkgdesc="Desktop GUI app for compressing videos and images to a target file size"
arch=('x86_64' 'aarch64')
url="https://github.com/Strawberry-Foundations/bitshrinker"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cargo' 'rust')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c4e1aaf2c6bc244505642ed03433ea3a5e4e1f77b4251e1e736e46a129c43c5b')

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
