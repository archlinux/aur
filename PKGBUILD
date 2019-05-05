# Maintainer: Jan Ole Zabel <joz@spline.de>, Philipp Fleischer <deleaf@spline.de>, Enno Strauß <roxc@spline.de>
pkgname=ram
pkgver=0.4.1
pkgrel=0
pkgdesc="Rust AUR Manager – an AUR helper and pacman wrapper written in rust"
arch=('x86_64')
url="https://gitlab.spline.inf.fu-berlin.de/gordon/ram"
license=('GPLv3')
makedepends=('cargo')
depends=('pacman' 'sudo' 'bash')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('a09856d692009f9d2d2e4fade5d9517350b6f4b21d1431bf7f2b497a4bf35e4d33ee6603d0e76a115f1a03a813bb00661a387cdfb6e1f693188919e8c1bc8d16')

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


