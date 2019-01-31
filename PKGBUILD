pkgname=diesel_cli_git
pkgver=1.4.1.r6.gd4eb2c1f
pkgrel=1
pkgdesc='CLI for the Diesel crate'
arch=(i686 x86_64)
url='http://diesel.rs/'
license=(MIT Apache)
depends=(sqlite postgresql-libs libmariadbclient)
makedepends=(cargo)
source=("git+https://github.com/diesel-rs/diesel.git")
sha256sums=('SKIP')
provides=('diesel_cli')
conflicts=('diesel_cli')

pkgver() {
	cd "$srcdir/diesel"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/diesel/diesel_cli"
	cargo build --release
}

package() {
	install -Dm755 "$srcdir/diesel/target/release/diesel" "$pkgdir/usr/bin/diesel"
	install -d "$pkgdir/etc/bash_completion.d"
	"$pkgdir/usr/bin/diesel" bash-completion >"$pkgdir/etc/bash_completion.d/diesel"
}
