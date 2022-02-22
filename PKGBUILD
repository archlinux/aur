# Maintainer: Aakash Sharma <aakashsensharma@gmail.com>
pkgname='wayshot-git'
_pkgname="wayshot"
pkgver=0.1.0.38.gb618361
pkgrel=1
arch=('x86_64')
url="https://github.com/waycrate/wayshot"
pkgdesc="A screenshot tool for wlroots compositors."
license=('BSD')
depends=('slurp')
makedepends=('rustup' 'git')
conflicts=('wayshot-musl-git')
source=("$_pkgname::git+https://git.sr.ht/~shinyzenith/$_pkgname")
sha256sums=('SKIP')

build(){
	cd "$_pkgname"
	cargo build --release
}

package() {
	cd "$_pkgname"
	install -Dm 755 ./target/release/wayshot "$pkgdir/usr/bin/wayshot"
}

pkgver() {
	cd $_pkgname
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}
