# Maintainer: Linus Probert <linus.probert@gmail.com>
pkgname=blightmud-git
pkgver=3.0.0.414.g1783b62
pkgrel=1
epoch=
pkgdesc="A terminal mud client written in rust"
arch=('x86_64' 'i686')
url="https://github.com/blightmud/blightmud"
license=('GPL')
groups=()
depends=('gcc-libs')
makedepends=('cargo' 'git')
checkdepends=()
optdepends=()
provides=('blightmud')
conflicts=('blightmud')
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+https://github.com/blightmud/blightmud.git#branch=dev")
sha256sums=('SKIP')

pkgver() {
	cd $pkgname
	echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git describe --always)
}

build() {
	cd $pkgname
	cargo build --release
}

check() {
	cd $pkgname
	cargo test
}

package() {
	cd $pkgname
	install -D -m755 "$srcdir/$pkgname/target/release/blightmud" "$pkgdir/usr/bin/blightmud"
}
