pkgname=diesel_cli
pkgver=1.3.1
pkgrel=2
pkgdesc='CLI for the Diesel crate'
arch=(i686 x86_64)
url='http://diesel.rs/'
license=(MIT Apache)
depends=(sqlite postgresql-libs libmariadbclient)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/diesel-rs/diesel/archive/v$pkgver.tar.gz")
sha256sums=('a6754b76dc0f6fdf73b946d0ed2f443b09abfa7a4de6660f17a6b091a406c719')

build() {
	cd "$srcdir/diesel-$pkgver/$pkgname"
	cargo build --release
}

package() {
	install -Dm755 "$srcdir/diesel-$pkgver/target/release/diesel" "$pkgdir/usr/bin/diesel"
	install -d "$pkgdir/etc/bash_completion.d"
	"$pkgdir/usr/bin/diesel" bash-completion >"$pkgdir/etc/bash_completion.d/diesel"
}
