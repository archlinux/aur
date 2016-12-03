pkgname=flow-git
pkgver=0.3.4.98
pkgrel=1
pkgdesc="A realtime log analyzer ."
arch=('x86_64' 'i686')
url="https://github.com/viseztrance/flow"
license=('GPL-3.0')
depends=()
makedepends=('cargo')
optdepends=()
provides=('flow')
conflicts=('flow')
source=($pkgname::git+https://github.com/viseztrance/flow.git)
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
	install -D -m755 "$srcdir/$pkgname/target/release/flow" "$pkgdir/usr/bin/flow"
}
