pkgname=cargo-license-git
pkgver=0.1.3.9
pkgrel=1
pkgdesc="Cargo subcommand to see license of dependencies"
arch=('x86_64' 'i686')
url="https://github.com/onur/cargo-license"
license=('MIT')
depends=()
makedepends=('cargo')
optdepends=()
provides=('cargo-license')
conflicts=('cargo-license')
source=($pkgname::git+https://github.com/onur/cargo-license.git)
sha256sums=('SKIP')

pkgver() {
    cd $pkgname
	echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD)
}

build() {
    cd $pkgname
	cargo build --release
}

package() {
	cd $pkgname
	install -D -m755 "$srcdir/$pkgname/target/release/cargo-license" "$pkgdir/usr/bin/cargo-license"
}
