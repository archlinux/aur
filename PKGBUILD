# Maintainer: Christian Hesse <mail@eworm.de

pkgname=libyubikey
pkgver=1.12
pkgrel=2
pkgdesc="Yubico C low-level library"
arch=('i686' 'x86_64')
url="https://github.com/Yubico/yubico-c"
license=('custom:BSD')
depends=('libusb')
makedepends=('asciidoc')
install=libyubikey.install
source=("https://github.com/Yubico/yubico-c/archive/${pkgname}-${pkgver}.tar.gz")

build() {
	cd ${srcdir}/yubico-c-${pkgname}-${pkgver}/

	autoreconf -fi
	./configure --prefix=/usr
	make
}

package() {
	cd ${srcdir}/yubico-c-${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}/" install

	install -D -m0644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	install -D -m0644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

sha256sums=('647fe761d59070ab67b4fc3c0d2e6c7d77ea1bcc28ef443652ac3e26b5cf4e47')
