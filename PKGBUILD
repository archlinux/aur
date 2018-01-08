pkgname=diesel_cli
pkgver=1.0.0
pkgrel=2
pkgdesc='CLI for the Diesel crate'
arch=(i686 x86_64)
url='http://diesel.rs/'
license=(MIT Apache)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/diesel-rs/diesel/archive/v$pkgver.tar.gz")
sha256sums=('781fc72e7580e98f47b859e737bc2d40d92d50bfe8dbe2aedd5cf3e4a9289013')

build() {
	cd "$srcdir/diesel-$pkgver/$pkgname"
	cargo build --release
}

package() {
	install -Dm755 "$srcdir/diesel-$pkgver/target/release/diesel" "$pkgdir/usr/bin/diesel"
	install -d "$pkgdir/etc/bash_completion.d"
	"$pkgdir/usr/bin/diesel" bash-completion >"$pkgdir/etc/bash_completion.d/diesel"
}
