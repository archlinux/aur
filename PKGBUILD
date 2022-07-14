# Maintainer: rv178

_pkgname=baker
pkgname="${_pkgname}-git"
pkgver=1.0.0.32.g508b2f6
pkgrel=1
pkgdesc="A simple build automation tool."
arch=("x86_64")
url="https://github.com/rv178/baker"
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
	install -Dm 755 ./target/release/bake "$pkgdir/usr/bin/bake"
	install -Dm 644 ./docs/*.1 -t "$pkgdir/usr/share/man/man1/"
}

