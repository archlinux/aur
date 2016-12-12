pkgname=alacritty-git
pkgver=0.1.0.222
pkgrel=1
pkgdesc="WORK IN PROGRESS - a terminal"
arch=('x86_64' 'i686')
url="https://github.com/jwilm/alacritty"
license=('Apache-2.0')
depends=()
makedepends=('cargo')
optdepends=()
provides=('alacritty')
conflicts=('alacritty')
source=($pkgname::git+https://github.com/jwilm/alacritty.git)
sha256sums=('SKIP')

pkgver() {
    cd $pkgname
	echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD)
}

build() {
    cd $pkgname
	cargo update
	cargo build --release
}

package() {
	cd $pkgname
	install -D -m755 "$srcdir/$pkgname/target/release/alacritty" "$pkgdir/usr/bin/alacritty"
}
