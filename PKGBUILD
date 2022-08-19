# Maintainer: rv178

_pkgname=bday
pkgname="${_pkgname}-git"
pkgver=0.1.0.15.g9c82d4a
pkgrel=1
pkgdesc="CLI birthday tracker."
arch=("x86_64")
url="https://github.com/rv178/bday"
license=("MIT")
makedepends=("rustup" "git")
source=("${_pkgname}::git+${url}.git")
sha256sums=("SKIP")

pkgver() {
	cd $_pkgname
	echo "$(grep "^version =" Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	rustup install stable
	rustup default stable
	cargo build --release
}

package() {
	cd "$_pkgname"
	install -Dm 755 ./target/release/bday "$pkgdir/usr/bin/bday"
}

