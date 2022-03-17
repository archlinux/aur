# Maintainer: Alex Macleod <alex@macleod.io>
pkgname=findpkg
pkgver=1.0.0
pkgrel=1
pkgdesc="A fast command not found hook"
arch=(any)
url="https://github.com/Alexendoo/findpkg"
license=(MIT)
depends=(pacman)
makedepends=(cargo)
options=(emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Alexendoo/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('0418c327b8211077b5fe9308bb434faa5a81d8f2f8a64032626f7404d5f310b3')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked --target-dir target
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 target/release/findpkg "$pkgdir/usr/bin/findpkg"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/findpkg/LICENSE"
	mkdir -pm755 "$pkgdir/var/lib/findpkg/"
}
