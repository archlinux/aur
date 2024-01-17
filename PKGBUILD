# Maintainer: AEnterprise

_pkgname=hyprwatch
pkgname="$_pkgname-git"
pkgrel=1
pkgdesc="A CLI abstraction tool over Hyperland's event socket with some extra data."
pkgver="0.1.0"
arch=(x86_64)
url="https://github.com/VirtCode/hyprwatch"
license=(MIT)
depends=()
makedepends=(
	cargo-nightly
	git
	)
optdepends=()
provides=("$_pkgname")
conflicts=()
b2sums=('SKIP')

source=("git+$url.git")

pkgver() {
	cat $_pkgname/Cargo.toml | grep '^version = ' | sed 's/^version = //g'
}

prepare() {
	cd $_pkgname
	export RUSTUP_TOOLSCHAIN=nightly
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd $_pkgname
	export RUSTUP_TOOLCHAIN=nightly
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}



package() {
	cd $_pkgname
	install -Dm755 "target/release/$_pkgname" -t "$pkgdir/usr/bin/"
}
