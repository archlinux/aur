# Maintainer: Andri Yngvason <andri@yngvason.is>

pkgname=neatvnc
pkgver=0.4.0
pkgrel=1
pkgdesc='Fast and neat VNC server library'
arch=(x86_64 i686 aarch64 armv7h)
url=https://github.com/any1/neatvnc
license=(custom:ISC)
depends=(aml pixman gnutls libjpeg-turbo)
makedepends=(meson ninja libdrm)
source=("$pkgname-v$pkgver.tar.gz::https://github.com/any1/neatvnc/archive/v$pkgver.tar.gz")
sha512sums=('cfbba3e81e1319b3c0f87644c7fb92e2a72d993c107722d6cb2e23674e1c4bfe9c281442a508a14d3e16964529d0646d1b9726d8f081157fb902454637346a7d')

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
