# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=liblc3
pkgver=1.0.0
pkgrel=1
pkgdesc="Low Complexity Communication Codec"
arch=(x86_64)
url="https://github.com/google/liblc3"
license=('Apache')
depends=()
makedepends=(meson)
checkdepends=()
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/google/liblc3/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bc819ba37ce6f932f0c4c9aadeab21904e73eeecc36bf288f1b01857d37b856f')

build() {
	cd "$pkgname-$pkgver"

	rm -r build
	arch-meson build -Dtools=true
	meson compile -C build
}

package() {
	cd "$pkgname-$pkgver"

	meson install --destdir "$pkgdir" -C build
	install -D -t "$pkgdir/usr/bin" build/tools/{elc3,dlc3}
}
