# Maintainer: AlphaLynx <alphalynx@protonmail.com>
pkgname=vsv
pkgver=2.0.0
pkgrel=1
pkgdesc='Runit service manager CLI'
arch=('x86_64')
url='https://github.com/bahamas10/$pkgname'
license=('MIT')
depends=('runit' 'glibc' 'gcc-libs')
makedepends=('cargo' 'git')
source=("$pkgname::git+https://github.com/bahamas10/vsv.git#tag=v$pkgver")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --tags | sed -E 's/^v([0-9]+\.[0-9]+\.[0-9]+).*/\1/'
}

build() {
	cd "$srcdir/$pkgname"
	cargo build --release
}

check() {
	cd "$srcdir/$pkgname"
	cargo test
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 target/release/vsv "$pkgdir/usr/bin/$pkgname"
	install -Dm644 man/vsv.8 "$pkgdir/usr/share/man/man8/$pkgname.8"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 CHANGES.md "$pkgdir/usr/share/doc/$pkgname/CHANGES.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
