# Maintainer: bkfox
# Contributor: Vojtech Kral <vojtech_kral^hk>
# Contributor: Félix Saparelli <aur@passcod.name>
# Contributor: ask

pkgname=rust-bindgen-git
pkgver=0.53.2.63ae30b
pkgrel=1
pkgdesc="Binding generator for rust language"
arch=('i686' 'x86_64')
url="https://github.com/rust-lang-nursery/rust-bindgen"
license=('BSD')
makedepends=('rust')
depends=('clang>=4.0.0')
source=('git://github.com/rust-lang-nursery/rust-bindgen.git')
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/rust-bindgen"
    version=`grep version Cargo.toml -h --color=never | head -n 1 | sed "s/version = \"\([^\n]\+\)\"/\1/"`
	printf "%s.%s" "$version" "$(git log --pretty=format:%h --abbrev-commit -n1)"
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
