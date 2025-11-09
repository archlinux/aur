# Maintainer: brenno <dev@brenno.codes>

pkgname=rogauracore
pkgver=1.6.2
pkgrel=1
pkgdesc="RGB keyboard control for Asus ROG laptops"
arch=('x86_64')
url="https://github.com/Syndelis/rogauracore"
license=('MIT')
depends=('glibc' 'libusb' 'udev')
makedepends=('git')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Syndelis/rogauracore/archive/refs/tags/1.6.2.tar.gz")
conflicts=('rogauracore')
provides=('rogauracore')
sha256sums=('9a783383b6f6f48c64411ccd9c2b3255ba339088c978c49b85e6eaa0fd903a73')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	autoreconf -i
	./configure --prefix=/usr --disable-debug
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" udevrulesdir="/usr/lib/udev/rules.d" install
}

