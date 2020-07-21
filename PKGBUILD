pkgname='dijo-git'
_pkgname="dijo"
pkgver=0.1.4.107.g2a3be00
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/NerdyPepper/dijo"
pkgdesc="scriptable, curses-based, digital habit tracker"
license=('MIT')
depends=()
makedepends=('rust' 'cargo' 'git')
checkdepends=()
provides=('dijo')
conflicts=('dijo')
source=("$_pkgname::git+https://github.com/NerdyPepper/dijo.git")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build(){
  cd "$_pkgname"
  cargo build --release --locked
}

package() {
	cd $_pkgname

	install -D -m755 "target/release/dijo" "$pkgdir/usr/bin/dijo"
}
