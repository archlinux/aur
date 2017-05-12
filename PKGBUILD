# Maintainer: Vojtech Kral <vojtech_kral^hk>
# Contributor: Félix Saparelli <aur@passcod.name>
# Contributor: ask

pkgname=rust-bindgen-git
pkgver=0.25.0.18b7e62
pkgrel=1
pkgdesc="Binding generator for rust language"
arch=('i686' 'x86_64')
url="https://github.com/servo/rust-bindgen"
license=('BSD')
makedepends=('rust')
depends=('clang>=4.0.0')
source=('git://github.com/servo/rust-bindgen.git')
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/rust-bindgen"
	printf "%s.%s" "`grep version Cargo.toml | sed "s/version\ = \"\([^\"]\+\)\"/\1/"`" "$(git log --pretty=format:%h --abbrev-commit -n1)"
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
