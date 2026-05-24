# Maintainer: Juliandev02 <julian@strawberryfoundations.org>

pkgname=clean-my-keys
pkgver=1.0.0
pkgrel=1
pkgdesc="Utility to safely lock and clean your keyboard without breaking your workflow"
arch=('x86_64' 'aarch64')
url="https://github.com/Strawberry-Foundations/clean-my-keys"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'rust')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('dd8e28ef7f035d35b704d26d2833a1df95be7b1e0e59c7b078cc762d7f066991')

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
	install -Dm644 "clean-my-keys.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
