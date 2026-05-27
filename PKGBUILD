# Maintainer: Juliandev02 <julian@strawberryfoundations.org>

pkgname=clean-my-keys
pkgver=1.2.2
pkgrel=2
pkgdesc="Utility to safely lock and clean your keyboard without breaking your workflow"
arch=('x86_64' 'aarch64')
url="https://github.com/Strawberry-Foundations/clean-my-keys"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'rust')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2638b670a7e0cd9b00fb205ed4ad00296c64316c06dc000473c36e41fe3b9d72')

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
