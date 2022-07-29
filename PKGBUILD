# Maintainer: Aakash Sharma <aakashsensharma@gmail.com>
pkgname='wayshot-git'
_pkgname="wayshot"
pkgver=1.1.9.98.g538caac
pkgrel=1
arch=('x86_64')
url="https://git.sr.ht/~shinyzenith/wayshot"
pkgdesc="A screenshot tool for wlroots compositors."
license=('BSD')
optdepends=('slurp: for area selection')
makedepends=('rustup' 'git' 'scdoc')
conflicts=('wayshot-bin' 'wayshot-musl-git')
source=("$_pkgname::git+https://git.sr.ht/~shinyzenith/$_pkgname")
sha256sums=('SKIP')

build(){
	cd "$_pkgname"
	cargo build --release
}

package() {
	cd "$_pkgname"
	install -Dm 755 ./target/release/wayshot "$pkgdir/usr/bin/wayshot"
	install -Dm 644 ./docs/wayshot.1.gz "$pkgdir/usr/share/man/man1/wayshot.1.gz"
	install -Dm 644 ./docs/wayshot.7.gz "$pkgdir/usr/share/man/man7/wayshot.7.gz"
}

pkgver() {
	cd $_pkgname
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}
