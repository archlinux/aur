# Maintainer: Alexander Schnaidt <alex.schnaidt@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>

pkgname=libyubikey
pkgver=1.13
pkgrel=1
pkgdesc="Yubico C low-level library"
arch=('i686' 'x86_64')
url="https://github.com/Yubico/yubico-c"
license=('custom:BSD')
depends=('libusb')
makedepends=('asciidoc')
install=libyubikey.install
source=("https://developers.yubico.com/yubico-c/Releases/$pkgname-$pkgver.tar.gz"
	"https://developers.yubico.com/yubico-c/Releases/$pkgname-$pkgver.tar.gz.sig")
sha256sums=('04edd0eb09cb665a05d808c58e1985f25bb7c5254d2849f36a0658ffc51c3401'
            'SKIP')
validpgpkeys=(0A3B0262BCA1705307D5FF06BCA00FD4B2168C0A) # Klas Lindfors <klas@yubico.com>

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	autoreconf -fi
	./configure --prefix=/usr
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	make DESTDIR="${pkgdir}/" install

	install -D -m0644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	install -D -m0644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
