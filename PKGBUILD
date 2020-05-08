pkgname='fix-stacks-git'
_pkgname="fix-stacks"
pkgver=0.1.0.49.gb8b127d
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/mozilla/fix-stacks"
pkgdesc="This program post-processes the stack frames produced by MozFormatCodeAddress"
license=('Apache' 'MIT')
depends=()
makedepends=('rust' 'cargo' 'git')
provides=('fix-stacks')
conflicts=('fix-stacks')
source=("$_pkgname::git+https://github.com/mozilla/fix-stacks.git")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build(){
  cd "$_pkgname"
  env CARGO_INCREMENTAL=0 cargo build --release --locked
}

package() {
	cd $_pkgname

	install -D -m755 "target/release/fix-stacks" "$pkgdir/usr/bin/fix-stacks"
}
