# Maintainer: Aakash Sharma <aakashsensharma@gmail.com>
pkgname='wayshot-musl-git'
_pkgname="wayshot"
pkgver=1
pkgrel=1
arch=('x86_64')
url="https://github.com/waycrate/wayshot"
pkgdesc="A display server independent hotkey daemon inspired by sxhkd."
license=('BSD')
conflicts=('wayshot-glib-git')
depends=('slurp')
makedepends=('rustup' 'make' 'git')
source=("$_pkgname::git+https://github.com/waycrate/$_pkgname")
sha256sums=('SKIP')

build(){
	cd "$_pkgname"
	make setup
	make
}

package() {
	cd "$_pkgname"
	install -Dm 755 ./bin/wayshot "$pkgdir/usr/bin/wayshot"
}

pkgver() {
	cd $_pkgname
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}
