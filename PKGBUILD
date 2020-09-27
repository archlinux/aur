# Maintainer: Andri Yngvason <andri@yngvason.is>

pkgname=neatvnc
pkgver=0.3.2
pkgrel=0
pkgdesc='Fast and neat VNC server library'
arch=(x86_64)
url=https://github.com/any1/neatvnc
license=(custom:ISC)
depends=(aml pixman gnutls libjpeg-turbo)
makedepends=(meson ninja libdrm)
source=("$pkgname-v$pkgver.tar.gz::https://github.com/any1/neatvnc/archive/v$pkgver.tar.gz")
sha512sums=('c47c60ead46d866ddf63cd21e961062e65b886a67f90926fadeca5e3e13fe52d05acd6fd51e921c45b09ae7c79658d85dfed381091dfc0e52c2680ccd8e7c1b6')

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
