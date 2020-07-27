# Maintainer: Andri Yngvason <andri@yngvason.is>

pkgname=aml
pkgver=0.1.0
pkgrel=0
pkgdesc="Another Main Loop"
arch=(x86_64)
url=https://github.com/any1/aml
license=(custom:ISC)
depends=()
makedepends=(meson ninja)
source=("$pkgname-v$pkgver.tar.gz::https://github.com/any1/aml/archive/v$pkgver.tar.gz")
sha512sums=('d22cc6b597b90fc9df830e7e444e0cd2aac87e0fd882c8daf3485b3d5825d2b5b86a32ecc612cb5d907e66a0aa22911f4aae3e9b9267c0278b115ff726879d80')

build() {
	cd $pkgname-$pkgver
	arch-meson build -Dtls=enabled
	ninja -C build
}

package() {
	cd $pkgname-$pkgver
	DESTDIR="$pkgdir" ninja -C build install
	install -Dm 644 COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
}
