pkgname=gitoxide-git
pkgver=0.17.0.9516
pkgrel=1
pkgdesc="An idiomatic, lean, fast & safe pure Rust implementation of Git"
arch=('x86_64' 'i686')
url="https://github.com/Byron/gitoxide"
license=('MIT' 'Apache')
depends=('cargo')
makedepends=('cargo' 'git')
optdepends=()
provides=('gitoxide')
conflicts=('gitoxide')
source=($pkgname::git+https://github.com/Byron/gitoxide)
sha256sums=('SKIP')

pkgver() {
	cd $pkgname
	echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD)
}

build() {
	cd $pkgname
	env CARGO_INCREMENTAL=0 cargo build --release
}

package() {
	cd $pkgname
	install -D -m755 "$srcdir/$pkgname/target/release/gix" "$pkgdir/usr/bin/gix"
	install -D -m755 "$srcdir/$pkgname/target/release/ein" "$pkgdir/usr/bin/ein"
}
