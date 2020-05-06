# Maintainer: V1oL3nc <v1ol3nc@protonmail.com>
pkgname='fusion'
pkgver=0.5.0.11.ge7e1c45
pkgrel=1
arch=('x86_64')
url="https://github.com/V1oL3nc/fusion"
pkgdesc="Simple wlan management tool with gnu-like syntax"
license=('GPL')
depends=('networkmanager')
makedepends=('cargo' 'git')
checkdepends=()
provides=('fusion')
conflicts=('fusion')
source=("$pkgname::git+https://github.com/V1oL3nc/fusion.git")
sha256sums=('SKIP')

prepare() {
	cd $pkgname
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	env CARGO_INCREMENTAL=0 cargo build --release --locked
}

check() {
	cd "$pkgname"
	env CARGO_INCREMENTAL=0 cargo check
}

package() {
	cd $pkgname
	install -D -m755 "target/release/fusion" "$pkgdir/usr/bin/fusion"
}
