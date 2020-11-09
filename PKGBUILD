pkgname=git-dit-git
_pkgname=git-dit
pkgdesc="Decentralized Issue Tracking for git"
pkgrel=2
pkgver=0.4.0.923
arch=('i686' 'x86_64')
conflicts=("git-dit")
provides=("git-dit")
url="https://github.com/neithernut/git-dit"
license=('GPL2')
depends=('git')
makedepends=('rust' 'cargo' 'pandoc')
source=("$_pkgname::git+https://github.com/neithernut/git-dit.git")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD)"
}

build() {
	cd $_pkgname
	env CARGO_INCREMENTAL=0 cargo build --release --features manpage
}

package() {
	cd $_pkgname
	install -D -m644 "$srcdir/$_pkgname/git-dit.1" "$pkgdir/usr/share/man/man1/git-dit.1"
	install -D -m755 "$srcdir/$_pkgname/target/release/git-dit" "$pkgdir/usr/bin/git-dit"
}
