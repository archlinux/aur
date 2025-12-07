# Maintainer: Braden Mars <bradenmars@bradenmars.me>

pkgname=tesla_auth
pkgver=0.11.0
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Tesla token generator"
url="https://github.com/adriankumpf/tesla_auth"
license=('MIT OR Apache-2.0')
makedepends=('rust' 'cargo')
depends=('webkit2gtk-4.1' 'xdotool')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('20a316f2af4ba1e5c92ea8bdd6f4c53ab504f66896502a88528e9e0d4f37cb3a')
provides=('tesla_auth')
conflicts=('tesla_auth')

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked --offline
}

package() {
	cd "$pkgname-$pkgver"
	install -D -m755 "target/release/tesla_auth" "$pkgdir/usr/bin/tesla_auth"
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
