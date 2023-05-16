#Maintainer: Rein Fernhout (LevitatingBusinessMan) <me@levitati.ng>

pkgname=openai-cli
pkgver=r27.e66bf5d
arch=("x86_64")
pkgrel=1
pkgdesc="CLI for the GPT model"
license=("MIT")
makedepends=("rust" "git")
url="https://github.com/LevitatingBusinessMan/$pkgname"
source=("git+https://github.com/LevitatingBusinessMan/$pkgname")
sha256sums=("SKIP")

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname}"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "${srcdir}/${pkgname}"
	cargo build --release
}

package() {
	cd "${srcdir}/${pkgname}"
	install -Dm755 target/release/$pkgname $pkgdir/usr/bin/$pkgname
}
