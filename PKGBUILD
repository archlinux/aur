pkgname=diesel_cli
pkgver=0.13.0
pkgrel=1
pkgdesc='CLI for the Diesel crate'
arch=(i686 x86_64)
url='http://diesel.rs/'
license=(MIT Apache)
depends=(rust)
makedepends=(cargo)
source=("https://github.com/diesel-rs/diesel/archive/v$pkgver.tar.gz")
sha256sums=('1c96681dff82678a9d2d5fcdd5d69c5521dd8ce9772c61f0c65bd9bba5f43e61')

build() {
	cd "$srcdir/diesel-$pkgver/$pkgname"
	cargo build --release
}

package() {
	install -Dm755 "$srcdir/diesel-$pkgver/target/release/diesel" "$pkgdir/usr/bin/diesel"
	install -d "$pkgdir/etc/bash_completion.d"
	"$pkgdir/usr/bin/diesel" bash-completion >"$pkgdir/etc/bash_completion.d/diesel"
}
