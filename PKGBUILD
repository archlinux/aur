pkgname=skim-git
pkgver=0.2.1.207
pkgrel=1
pkgdesc=" Fuzzy Finder in rust!"
arch=('x86_64' 'i686')
url="https://github.com/lotabout/skim"
license=('MIT')
depends=('ncurses')
makedepends=('cargo')
optdepends=()
provides=('skim')
conflicts=('skim')
source=($pkgname::git+https://github.com/lotabout/skim.git)
sha256sums=('SKIP')

pkgver() {
    cd $pkgname
	echo $(python -c "print('$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2)'.split('-')[0])").$(git rev-list --count HEAD)
}

build() {
    cd $pkgname
	cargo build --release
}

package() {
	cd $pkgname
	install -D -m755 "$srcdir/$pkgname/target/release/sk" "$pkgdir/usr/bin/sk"
}
