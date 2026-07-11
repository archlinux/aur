# Maintainer: rv178 <hey@rohith.net>

_pkgname=txm
pkgname="${_pkgname}-git"
pkgver=0.1.3.26.gcc5ade3
pkgrel=1
pkgdesc="Terminal math rendering engine."
arch=("x86_64")
options=('!debug' '!strip')
url="https://github.com/thatmagicalcat/txm"
license=("MIT OR Apache-2.0")
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
	install -Dm 755 ./target/release/txm "$pkgdir/usr/bin/txm"
}
