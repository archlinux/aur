pkgname=loc-git
pkgver=0.3.2.107
pkgrel=1
pkgdesc="Count lines of code quickly."
arch=('x86_64' 'i686')
url="https://github.com/cgag/loc"
license=('MIT')
depends=()
makedepends=('cargo')
optdepends=()
provides=('loc')
conflicts=('loc')
source=($pkgname::git+https://github.com/cgag/loc.git)
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
	install -D -m755 "$srcdir/$pkgname/target/release/loc" "$pkgdir/usr/bin/loc"
}
