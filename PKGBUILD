# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=dedoc
pkgver=0.2.5
pkgrel=1
pkgdesc='terminal based viewer for DevDocs'
arch=('x86_64')
url='https://github.com/toiletbril/dedoc'
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'openssl')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/toiletbril/dedoc/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('78b984e70c9ccb6031e549224be556378f9bf46bccd4d516634d50db31e8991b173d0d5b7b80f090accf7d31d14e0a8e00dc389a880f6c89661630c6ae0b0620')

build() {
	cd "$pkgname-$pkgver"

	cargo build --release --locked
}

check() {
	cd "$pkgname-$pkgver"

	cargo test --release --locked
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 "target/release/dedoc" "$pkgdir/usr/bin/dedoc"

	install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
