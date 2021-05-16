pkgname='rd-git'
_pkgname="rd"
pkgver=0.0.0.1728.gf11ec8e
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/sidkshatriya/rd"
pkgdesc="a record/replay debugger written in rust"
license=('custom')
depends=('capnproto' 'gdb')
makedepends=('rust' 'cargo' 'git' 'cmake' 'make' 'clang')
provides=('rd')
conflicts=('rd')
source=("$_pkgname::git+https://github.com/sidkshatriya/rd.git")
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

	install -D -m755 "target/release/rd" "$pkgdir/usr/bin/rd"
}
