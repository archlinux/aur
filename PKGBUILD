# Maintainer: Bruno Felipe Leal Delfino <bruno.delfino1995@gmail.com>

pkgname='kct'
pkgver=0.3.1
pkgrel=1
arch=('x86_64')
url='https://github.com/kseat/kct'
pkgdesc='A Kubernetes Configuration Tool'
license=('MIT')
makedepends=('rust' 'cargo')
depends=('gcc-libs')
conflicts=('kct-bin' 'kct-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/oddin-org/kct/archive/v$pkgver.tar.gz")
sha256sums=('07bf41e5084b1be8df359a6f43dd52a5df1becb1ebb376b34237d53850054506')

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
