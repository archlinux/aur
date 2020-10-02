pkgname=tab-rs-git
pkgver=.129.g6c95b47
pkgrel=1
pkgdesc="The intuitive config-driven terminal multiplexer"
arch=('x86_64' 'i686')
url="https://github.com/austinjones/tab-rs"
license=('MIT')
depends=()
makedepends=('cargo' 'git')
optdepends=()
provides=('tab')
conflicts=('tab')
source=($pkgname::git+https://github.com/austinjones/tab-rs)
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
	install -D -m755 "$srcdir/$pkgname/target/release/tab" "$pkgdir/usr/bin/tab"
}
