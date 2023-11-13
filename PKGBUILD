# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: gloof <gloof11@proton.me>
pkgname=veilid-cli-git
pkgver=0.2.5
pkgrel=1
epoch=
pkgdesc="A text user interface to talk to veilid-server and operate it manually"
arch=(x86_64)
url="https://gitlab.com/veilid/veilid/-/archive/v$pkgver/veilid-v$pkgver.tar"
license=('MPL 2.0')
groups=()
depends=()
makedepends=("cargo")
checkdepends=()
optdepends=()
provides=(veilid-cli)
conflicts=(veilid-cli)
replaces=(veilid-cli)
backup=()
options=()
install=
changelog=
source=("$url")
noextract=()
md5sums=('b5873ff891902acd8d677b7010bfbfbd')
validpgpkeys=()

prepare() {
  cd "veilid-v$pkgver/veilid-cli"
  export RUSTUP_TOOLCHAIN=stable 
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "veilid-v$pkgver/veilid-cli"
	export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
	cd "veilid-v$pkgver/veilid-cli"
	export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
	cd "veilid-v$pkgver/veilid-cli"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/veilid-cli"
}
