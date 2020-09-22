# Maintainer: Andri Yngvason <andri@yngvason.is>

pkgname=neatvnc
pkgver=0.3.0
pkgrel=0
pkgdesc='Fast and neat VNC server library'
arch=(x86_64)
url=https://github.com/any1/neatvnc
license=(custom:ISC)
depends=(aml pixman gnutls libjpeg-turbo)
makedepends=(meson ninja libdrm)
source=("$pkgname-v$pkgver.tar.gz::https://github.com/any1/neatvnc/archive/v$pkgver.tar.gz")
sha512sums=('6b75a76d012be4d000d334fe4a5da774073dbcaaf9e1bf2a6e7fa54581575c45edb60c6ee267c649c67e638c2d14e2ac659b455d37ec7c05a82c97566ba63cab')

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
