# Maintainer:
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: petRUShka <petrushkin@yandex.ru>
# Contributor: Laramy Black <laramy2020@gmail.com>
# Contributor: Lorenzo Ferrillo <lorenzofersteam@live.it>

pkgname=diorite
pkgver=4.23.0
pkgrel=1
pkgdesc="Utility and widget library for Nuvola Player project based on GLib, GIO, and GTK"
arch=(x86_64)
url="https://tiliado.eu/diorite/"
license=(BSD)
depends=(gtk3 libgee sqlite libx11)
makedepends=(vala python-pyparsing gobject-introspection)
source=("https://github.com/tiliado/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('6ee91447a265762d090345276583e7bb4aab12fca5c9a4fa4b06d1afe8d68985')

build() {
	cd "${pkgname}-${pkgver}"
	./waf distclean configure \
		--prefix=/usr \
		--libdir=/usr/lib \
		--no-vala-lint \
		--novaladoc \
		--no-strict
	./waf build -v -p
}

package() {
	cd "${pkgname}-${pkgver}"
	./waf install --destdir="$pkgdir"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
