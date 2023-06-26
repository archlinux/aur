pkgname="cairo-lang"
pkgver=2.0.0
release="rc4"
pkgrel="4"
pkgdesc="Cairo language installation"
arch=("x86_64")
url="https://cairo-by-example.com/"
license=('MIT')
depends=("git" "rustup")
source=("https://github.com/starkware-libs/cairo/archive/refs/tags/v$pkgver-$release.tar.gz")
sha256sums=("e3dd3ce3f9ab5b69c44d01b13777d92516dcd830efb6a3d2cd46915d4f03e8a9")

prepare() {
	rustup override set stable
	rustup update
}

build() {
	cd "cairo-$pkgver-$release"
	cargo build --all --release --manifest-path ./Cargo.toml
	
}

package() {
	
	pkgs=("cairo-run" "cairo-compile" "cairo-format" "cairo-language-server" "cairo-test" "sierra-compile" "starknet-compile" "starknet-sierra-compile")
	
	mkdir -p $pkgdir/usr/bin/
	
	for pkg in ${pkgs[@]}; do
		mv cairo-$pkgver-$release/target/release/$pkg $pkgdir/usr/bin
	done
}

