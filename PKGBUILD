pkgname=fetcher-rs
_pkgname=fetcher
pkgver=0.12.2
pkgrel=1
pkgdesc='Automatic news fetching and parsing'
arch=('any')
url="https://github.com/SergeyKasmy/${_pkgname}"
license=('MPL-2.0')
makedepends=('rust')
source=("${_pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
	cd "$srcdir/$_pkgname-$pkgver"

	export FETCHER_MAIN_BRANCH_OVERRIDE=1
	cargo build --release
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "packaging/systemd/$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
}
