# Maintainer: Juliandev02 <julian@strawberryfoundations.org>

pkgname=clean-my-keys
pkgver=1.1.0
pkgrel=1
pkgdesc="Utility to safely lock and clean your keyboard without breaking your workflow"
arch=('x86_64' 'aarch64')
url="https://github.com/Strawberry-Foundations/clean-my-keys"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'rust')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('311ca670b97aa8e6bf2d567cacf7365fe57298d149aa6fac2a0b4fc50f820936')

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
