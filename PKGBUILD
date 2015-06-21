# Maintainer: Vojtech Kral
# Maintainer: Félix Saparelli <aur@passcod.name>
# Contributor: ask
# Repo: https://github.com/passcod/pkgs/tree/master/rust-bindgen-git

pkgname=rust-bindgen-git
pkgver=0.14.0.ba150d9
pkgrel=1
pkgdesc="Binding generator for rust language"
arch=('i686' 'x86_64')
url="https://github.com/crabtw/rust-bindgen"
license=('BSD')
makedepends=('rust')
source=('git://github.com/crabtw/rust-bindgen.git')
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/rust-bindgen"
	printf "%s.%s" "$(grep version Cargo.toml | cut -c12-17)" "$(git log --pretty=format:%h --abbrev-commit -n1)"
}

build() {
	cd "$srcdir/rust-bindgen"
	cargo build --release
}

package() {
	cd "$srcdir/rust-bindgen/target/release"
	install -D 'bindgen' "${pkgdir}/usr/bin/rust-bindgen"
	libbindgen=$(ls libbindgen*.rlib)
	install -D "$libbindgen" "${pkgdir}/usr/lib/${libbindgen}"
}
