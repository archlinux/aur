pkgname=cargo-web-git
pkgver=0.6.4.210.g77e40ef
pkgrel=1
pkgdesc="A Cargo subcommand for the client-side Web"
arch=('x86_64')
url="https://github.com/koute/cargo-web"
license=('MIT')
depends=('cargo')
makedepends=('cargo')
optdepends=()
provides=('cargo-web')
conflicts=('cargo-web')
source=($pkgname::git+https://github.com/koute/cargo-web)
sha256sums=('SKIP')

pkgver() {
	cd $pkgname
	echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git describe --always)
}

build() {
	cd $pkgname
	cargo build --release
}

package() {
	cd $pkgname
	install -Dm755 "$srcdir/$pkgname/target/release/cargo-web" "$pkgdir/usr/bin/cargo-web"
}
