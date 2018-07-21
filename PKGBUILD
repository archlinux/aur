# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=koio
pkgver=0.1.0
pkgrel=1
license=('MIT')
pkgdesc='tool & small library for embedding files in C programs'
arch=("any")
url='https://git.sr.ht/~sircmpwn/koio/'
source=("https://git.sr.ht/~sircmpwn/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.xz")
sha512sums=('1f28377542e35793be71bb53c9375f23e65531c9a314d5404d6c89345b5afd0a8b0a356c22675a7b093878179237704c761e4d4cb12f6bc27ced1fa6be286540')
makedepends=('meson' 'ninja')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	rm -rf "$srcdir"/build
	meson --prefix=/usr "$srcdir"/build
	ninja -C "$srcdir"/build
}

package() {
	cd "${srcdir}"/build
	DESTDIR="$pkgdir" ninja install
}
