pkgname=cargo-outofdate-git
pkgver=0.3.0.19.gddd4adf
pkgrel=1
pkgdesc="Check outdated cargo dependencies"
arch=('x86_64' 'i686')
url="https://github.com/quininer/cargo-outofdate"
license=('MIT')
depends=('cargo')
makedepends=('cargo')
optdepends=()
provides=('cargo-outofdate')
conflicts=('cargo-outofdate')
source=($pkgname::git+https://github.com/quininer/cargo-outofdate)
sha256sums=('SKIP')

pkgver() {
	cd $pkgname
	echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git describe --always)
}

build() {
	cd $pkgname
	env CARGO_INCREMENTAL=0 cargo build --release
}

package() {
	cd $pkgname
	install -D -m755 "$srcdir/$pkgname/target/release/cargo-outofdate" "$pkgdir/usr/bin/cargo-outofdate"
}
