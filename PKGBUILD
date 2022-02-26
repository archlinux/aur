# Maintainer: Aakash Sharma <aakashsensharma@gmail.com>
pkgname='wayout-git'
_pkgname="wayout"
pkgver=1
pkgrel=1
arch=('x86_64')
url="https://git.sr.ht/~shinyzenith/wayout"
pkgdesc="A simple output management tool for wlroots based compositors"
license=('BSD')
makedepends=('rustup' 'git')
conflicts=('wayout-bin')
source=("$_pkgname::git+https://git.sr.ht/~shinyzenith/$_pkgname")
sha256sums=('SKIP')

build(){
	cd "$_pkgname"
	cargo build --release
}

package() {
	cd "$_pkgname"
	install -Dm 755 ./target/release/wayout "$pkgdir/usr/bin/wayshot"
}

pkgver() {
	cd $_pkgname
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}
