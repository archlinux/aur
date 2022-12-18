# Maintainer: Timo Kettenbach
pkgname=invasion-of-greek
pkgver=1.0.0_pre_20220925
_commit=e36bd4fe82bbfa59808492f66358fabad41f3e3e
pkgrel=1
pkgdesc="a stupid arcade game for your terminal"
url="https://gitlab.fem-net.de/mabl/invasion-of-greek"
license=("MIT")
arch=("x86_64")
depends=()
makedepends=('rust')
provides=("invasion-of-greek")
conflicts=()
source=("https://gitlab.fem-net.de/mabl/invasion-of-greek/-/archive/${_commit}/invasion-of-greek-${_commit}.tar.gz")
sha256sums=('961f1a9e4fcd45e54b87d0bca545caa74b30a70924b9ca033cec2f06191c4789')

prepare() {
	cd "$pkgname-$_commit"
	cargo fetch --locked --target "x86_64-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$_commit"
	export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
	cargo build --release --frozen --all-targets
}

package() {
	cd "$pkgname-$_commit"
    install -Dm755 target/release/invasion-of-greek -t "$pkgdir/usr/bin"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
