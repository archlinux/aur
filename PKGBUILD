pkgname=diesel_cli
pkgver=0.99.1
pkgrel=1
pkgdesc='CLI for the Diesel crate'
arch=(i686 x86_64)
url='http://diesel.rs/'
license=(MIT Apache)
depends=(rust)
makedepends=(cargo)
source=("https://github.com/diesel-rs/diesel/archive/v$pkgver.tar.gz")
sha256sums=('23d8f1444d6ee0269d3cab3aa417cc28f41f5a0894df02e89aa7dfa6602568df')

build() {
	cd "$srcdir/diesel-$pkgver/$pkgname"
	cargo build --release
}

package() {
	install -Dm755 "$srcdir/diesel-$pkgver/target/release/diesel" "$pkgdir/usr/bin/diesel"
	install -d "$pkgdir/etc/bash_completion.d"
	"$pkgdir/usr/bin/diesel" bash-completion >"$pkgdir/etc/bash_completion.d/diesel"
}
