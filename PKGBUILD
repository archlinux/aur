# Maintainer: Andri Yngvason <andri@yngvason.is>

pkgname=neatvnc
pkgver=0.2.0
pkgrel=1
pkgdesc='Fast and neat VNC server library'
arch=(x86_64)
url=https://github.com/any1/neatvnc
license=(custom:ISC)
depends=(aml pixman gnutls libjpeg-turbo)
makedepends=(meson ninja libdrm)
source=("$pkgname-v$pkgver.tar.gz::https://github.com/any1/neatvnc/archive/v$pkgver.tar.gz")
sha512sums=('74ff4ec6a492eaeead90b5e5d789885c709e90d50f682ad127f0f364264324ed0e6c66859f4254cbe9b79ebabb20974ceded67d5cab6a5fa8fd1f664ea18b15f')

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
