# Maintainer: Jan Ole Zabel <joz@spline.de>, Philipp Fleischer <deleaf@spline.de>, Enno Strauß <roxc@spline.de>
pkgname=ram
pkgver=0.4.2
pkgrel=0
pkgdesc="Rust AUR Manager – an AUR helper and pacman wrapper written in rust"
arch=('x86_64')
url="https://gitlab.spline.inf.fu-berlin.de/gordon/ram"
license=('GPLv3')
makedepends=('cargo')
depends=('pacman' 'sudo' 'bash')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('95383ccf10f024e41f627313162fbf3f294e5045565ce8adaf1e6ba81a766fa0051306372ca1ff824b92c99075535c8766de4bbcd1a3aa11508b1603ae51cdfe')

build() {
	cd "$pkgname-v$pkgver"
	cargo update
	cargo build --release
}

package() {
	cd "$pkgname-v$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}


