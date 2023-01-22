# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Jacob Mealey <jacobmealey.maine@gmail.com>
pkgname=charta
pkgver=0.1a
pkgrel=1
epoch=
pkgdesc="A simple and native notes app for Gnome and GTK."
arch=(x86_64)
url=""
license=('MIT')
groups=()
depends=()
makedepends=(cargo)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(git+https://github.com/jacobmealey/charta)
noextract=()
md5sums=()
validpgpkeys=()
sha256sums=('SKIP')

prepare() {
	# cd "$pkgname-$pkgver"
	# patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
    cd "charta"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "charta"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release
}

check() {
	cd "charta"
    cargo test --release
}

package() {
	cd "charta"
    ./install.sh "$pkgdir"
}
