pkgname='kct'
pkgver=0.2.0
pkgrel=2
arch=('any')
url='https://github.com/kseat/kct'
pkgdesc='A Kubernetes Configuration Tool'
license=('MIT')
makedepends=('rust' 'cargo')
provides=('kct')
conflicts=('kct')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kseat/kct/archive/v$pkgver.tar.gz")
sha256sums=('2741090e944c8c096c9fe4318324bf0505520117c68415b4830d833cba9afaf5')

build(){
	cd "$pkgname-$pkgver"
	env CARGO_INCREMENTAL=0 cargo build --release --locked
}

check(){
	cd "$pkgname-$pkgver"
	env CARGO_INCREMENTAL=0 cargo test --release
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 'target/release/kct' "$pkgdir/usr/bin/kct"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
