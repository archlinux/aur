# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=cdecrypt
pkgver=4.8
pkgrel=1
pkgdesc="Decrypt Wii U NUS content"
arch=('x86_64')
url="https://github.com/VitaSmith/cdecrypt"
license=('GPL-3.0-or-later')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('08ec85d81adcafb2e55fde18e5c095603a35b72b7ef781723de5ceb20d7ffbaf')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i 's/-O2/-O2 ${EXTRA_CFLAGS}/;s/LDFLAGS=-s/LDFLAGS=-s ${EXTRA_LDFLAGS}/' Makefile
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	EXTRA_CFLAGS="${CFLAGS}" \
	EXTRA_LDFLAGS="${LDFLAGS}" \
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
