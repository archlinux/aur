pkgname=diesel_cli
pkgver=1.1.1
pkgrel=1
pkgdesc='CLI for the Diesel crate'
arch=(i686 x86_64)
url='http://diesel.rs/'
license=(MIT Apache)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/diesel-rs/diesel/archive/v$pkgver.tar.gz")
sha256sums=('b0f29d67c7251003eef3af515052bdc0dea3c72b08830a6ff1fc4b8b7b6b13a6')

build() {
	cd "$srcdir/diesel-$pkgver/$pkgname"
	cargo build --release
}

package() {
	install -Dm755 "$srcdir/diesel-$pkgver/target/release/diesel" "$pkgdir/usr/bin/diesel"
	install -d "$pkgdir/etc/bash_completion.d"
	"$pkgdir/usr/bin/diesel" bash-completion >"$pkgdir/etc/bash_completion.d/diesel"
}
