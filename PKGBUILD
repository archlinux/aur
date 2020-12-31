# Maintainer: Andri Yngvason <andri@yngvason.is>

pkgname=aml
pkgver=0.2.0
pkgrel=1
pkgdesc="Another Main Loop"
arch=(x86_64 i686 aarch64 armv7h)
url=https://github.com/any1/aml
license=(custom:ISC)
depends=()
makedepends=(meson ninja)
source=("$pkgname-v$pkgver.tar.gz::https://github.com/any1/aml/archive/v$pkgver.tar.gz")
sha512sums=('196cd891fdbaad47340d8b4ca9eb62a7f9e6b0969ae9ad744a3c9ea110a532691d53a1e39fde583bad0f8fdae4b51c3a4243bbdab65e952e5fc79ceb6efc3262')

build() {
	cd $pkgname-$pkgver
	arch-meson build
	ninja -C build
}

package() {
	cd $pkgname-$pkgver
	DESTDIR="$pkgdir" ninja -C build install
	install -Dm 644 COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
}
