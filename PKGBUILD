pkgname=git-journal-git
pkgver=1.3.0.261
pkgrel=1
pkgdesc="The Git Commit Message and Changelog Generation Framework"
arch=('x86_64' 'i686')
url="https://github.com/saschagrunert/git-journal"
license=('MIT')
depends=()
makedepends=('cargo')
optdepends=()
provides=('git-journal')
conflicts=('git-journal')
source=($pkgname::git+https://github.com/saschagrunert/git-journal.git)
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
	install -D -m755 "$srcdir/$pkgname/target/release/git-journal" "$pkgdir/usr/bin/git-journal"
	install -D -m644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
