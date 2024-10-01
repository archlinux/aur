# Maintainer: AlphaLynx <alphalynx@protonmail.com>
pkgname=vsv
pkgver=2.0.0
pkgrel=3
pkgdesc='Runit service manager CLI'
arch=('any')
url="https://github.com/bahamas10/$pkgname"
license=('MIT')
depends=('runit' 'glibc' 'gcc-libs')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bahamas10/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
	'svdir.patch')
sha256sums=('SKIP' 'SKIP')

prepare() {
	cd "$pkgname-$pkgver"
	patch -Np1 -i ../svdir.patch
}

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

check() {
	cd "$pkgname-$pkgver"
	cargo test
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 target/release/vsv "$pkgdir/usr/bin/$pkgname"
	install -Dm644 man/vsv.8 "$pkgdir/usr/share/man/man8/$pkgname.8"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 CHANGES.md "$pkgdir/usr/share/doc/$pkgname/CHANGES.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
