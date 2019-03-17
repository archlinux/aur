# Maintainer: Jan Ole Zabel <joz@spline.de>, Philipp Fleischer <deleaf@spline.de>, Enno Strauß <roxc@spline.de>
pkgname=ram
pkgver=0.3.0
pkgrel=0
pkgdesc="Rust AUR Manager – an AUR helper and pacman wrapper written in rust"
arch=('x86_64')
url="https://gitlab.spline.inf.fu-berlin.de/gordon/ram"
license=('GPLv3')
makedepends=('cargo')
depends=('pacman' 'sudo' 'bash')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('8dfda28c6cec5ba4751229d96f301433e969be059bb2516e847c3a93731ea8b0ff953e27a320aeea13f753c488928b09ed184ea78f392e296102eed39f3cfcff')

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


