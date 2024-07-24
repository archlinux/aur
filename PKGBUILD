# Maintainer: Accessory
_exe_name=minus_games_client
pkgname=$_exe_name-git
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc=""
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
source=("$pkgname-$pkgver::git+$url#branch=main")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

prepare() {
    export RUSTUP_TOOLCHAIN=nightly
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=nightly
	export CARGO_TARGET_DIR=target
	sed -i "s/Exec=run.sh/Exec=minus_games_client menu/g" "$pkgname-$pkgver/other/assets/client/io.github.accessory.minus_games_client.desktop" 
	cargo build --release --bin $_exe_name
}

check() {
	echo "No tests"
}

package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_exe_name"
	install -Dm0644 "$pkgname-$pkgver/other/assets/client/io.github.accessory.minus_games_client.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.accessory.minus_games_client.svg"
    install -Dm0644 "$pkgname-$pkgver/other/assets/client/io.github.accessory.minus_games_client.desktop" $pkgdir/usr/share/applications/io.github.accessory.minus_games_client.desktop
    install -Dm0644 "$pkgname-$pkgver/other/assets/client/io.github.accessory.minus_games_client.metainfo.xml" "$pkgdir/usr/share/metainfo/io.github.accessory.minus_games_client.metainfo.xml"
}
