pkgname=record-git
pkgver=0.2.0.9
pkgrel=1
pkgdesc="Records and replays input sent in a terminal session."
arch=('x86_64' 'i686')
url="https://github.com/gyscos/record"
license=('MIT')
depends=()
makedepends=('cargo')
optdepends=()
provides=('record')
conflicts=('record')
source=($pkgname::git+https://github.com/gyscos/record.git)
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
	install -D -m755 "$srcdir/$pkgname/target/release/record" "$pkgdir/usr/bin/record"
	install -D -m755 "$srcdir/$pkgname/target/release/replay" "$pkgdir/usr/bin/replay"
}
