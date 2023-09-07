# Maintainer: Isabel <isabel@isabelroses.com>
pkgname=catppuccinifier-cli-git
_pkgname=catppuccinifier
pkgver=r62.6045183
pkgrel=1
pkgdesc="An comand line tool to catppuccinifiy your images."
arch=('x86_64')
url="https://github.com/lighttigerXIV/catppuccinifier"
license=()
depends=()
provides=('catppuccinifier')
conflicts=('catppuccinifier')
makedepends=('git' 'cargo')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$pkgname/src/catppuccinifier-cli"
	cargo build --release
}

check(){
  cd "$pkgname/src/catppuccinifier-cli"
  cargo test --release
}

package() {
	cd "$pkgname"
	mkdir -p "$HOME/.local/share/catppuccinifier"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
	install -Dm755 "src/catppuccinifier-cli/target/release/catppuccinifier-cli" "$pkgdir/usr/bin/catppuccinifier"
}
