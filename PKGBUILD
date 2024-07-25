# Maintainer: Accessory
_exe_name=minus_games_server
pkgname=$_exe_name-git
pkgver=0.1.0
_source_folder=$pkgname-$pkgver
pkgrel=1
epoch=
pkgdesc="Minus Games Server"
arch=("x86_64")
url="https://github.com/Accessory/minus_games"
license=('MIT')
groups=()
depends=()
makedepends=(cargo-nightly)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$_source_folder::git+$url#branch=main")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

prepare() {
    export RUSTUP_TOOLCHAIN=nightly
	cd  $_source_folder
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=nightly
	export CARGO_TARGET_DIR=target
	cd  $_source_folder
	cargo build --release --bin $_exe_name
}

check() {
	echo "No tests"
}

package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "$_source_folder/target/release/$_exe_name"
}
