# Maintainer: Isabel <isabelroseslive@gmail.com>
pkgname=catppuccinifier-cli-git
_pkgname=catppuccinifier
pkgver=r36.bb94471
pkgrel=1
pkgdesc="An comand line tool to catppuccinifiy your images."
arch=('x86_64')
url="https://github.com/lighttigerXIV/catppuccinifier"
license=()
depends=()
makedepends=('git' 'cargo')
source=("$pkgname::git+$url")
md5sums=('SKIP')

build() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$pkgname/src/Linux/binaries-source/catppuccinifier-cli"
	cargo build --release
}

pkgver() {
	cd "$pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
	cd "src/Linux/binaries-source/catppuccinifier-cli"
	install -Dm755 "target/release/catppuccinifier-cli" "$pkgdir/usr/bin/catppuccinifier"
}
