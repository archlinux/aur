pkgname=fetcher-rs
pkgver=0.12.2
pkgrel=1
pkgdesc='Automatic news fetching and parsing'
arch=('any')
url="https://github.com/SergeyKasmy/${pkgname}"
license=('MPL-2.0')
makedepends=('rust')
source=("${pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	export FETCHER_MAIN_BRANCH_OVERRIDE=1
	cargo build --release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "packaging/systemd/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}
