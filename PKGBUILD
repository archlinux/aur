pkgname=cargo-bloat-git
pkgver=0.1.0.10.g0484c2d
pkgrel=1
pkgdesc="Find out what takes most of the space in your executable"
arch=('x86_64')
url="https://github.com/RazrFalcon/cargo-bloat"
license=('MIT')
depends=('cargo' 'http-parser' 'curl')
makedepends=('cargo')
optdepends=()
provides=('cargo-bloat')
conflicts=('cargo-bloat')
source=($pkgname::git+https://github.com/RazrFalcon/cargo-bloat)
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
	install -Dm755 "$srcdir/$pkgname/target/release/cargo-bloat" "$pkgdir/usr/bin/cargo-bloat"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
