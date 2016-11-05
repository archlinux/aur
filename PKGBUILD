pkgname=just-git
pkgver=0.2.15.173
pkgrel=1
pkgdesc="Just a command runner, like make."
arch=('x86_64' 'i686')
url="https://github.com/casey/just"
license=('WTFPL' 'MIT' 'Apache-2.0')
depends=()
makedepends=('cargo')
optdepends=()
provides=('just')
conflicts=('just')
source=($pkgname::git+https://github.com/casey/just.git)
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
	install -D -m755 "$srcdir/$pkgname/target/release/just" "$pkgdir/usr/bin/just"
}
