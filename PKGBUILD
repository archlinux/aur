# Maintainer: Juliandev02 <julian@strawberryfoundations.org>

pkgname=clean-my-keys
pkgver=1.2.0
pkgrel=1
pkgdesc="Utility to safely lock and clean your keyboard without breaking your workflow"
arch=('x86_64' 'aarch64')
url="https://github.com/Strawberry-Foundations/clean-my-keys"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'rust')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('24241fc0de1962be0fa676dbd58ab734749f2f9c21d292d5c2c1ce7cd70a0593')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	cargo build --release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 "assets/image/icon.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
	install -Dm644 "clean-my-keys.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
