# Maintainer: Bill Kolokithas <kolokithas.b@gmail.com>

pkgname=rtl8187se
pkgver=4.0
pkgrel=1
pkgdesc="Realtek PCI Express wireless driver for use in newer kernels"
arch=('i686' 'x86_64')
url="https://github.com/freestyl3r/rtl8187se"
license=('GPL2')
makedepends=('linux-headers')
provides=('r8187se')
source=("https://github.com/freestyl3r/$pkgname/archive/$pkgver.tar.gz"
		"$pkgname.install")

install=$pkgname.install
md5sums=('25be1f0db4ee448f7823b7fddda8abe2'
         '0f682bf6f9116dc5bc086fcfce769389')


build() {
	cd $pkgname-$pkgver
	make
}

package() {
	cd $pkgname-$pkgver
	_extramodules=extramodules-`uname -r | cut -d . -f 1,2`-ARCH
	install -Dm644 r8187se.ko "$pkgdir/lib/modules/$_extramodules/r8187se.ko"
	gzip "$pkgdir/lib/modules/$_extramodules/r8187se.ko"
}
