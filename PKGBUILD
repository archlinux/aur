pkgname='dump_syms-git'
_pkgname="dump_syms"
pkgver=0.0.5.102.ge28a20b
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/mozilla/dump_syms"
pkgdesc=" Rewrite of breakpad dump_syms tools in Rust"
license=('Apache' 'MIT')
depends=()
makedepends=('rust' 'cargo' 'git')
provides=('dump_syms')
conflicts=('dump_syms')
source=("$_pkgname::git+https://github.com/mozilla/dump_syms.git")
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

	install -D -m755 "target/release/dump_syms" "$pkgdir/usr/bin/dump_syms"
}
