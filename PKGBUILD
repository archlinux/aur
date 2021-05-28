# Maintainer:
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: petRUShka <petrushkin@yandex.ru>
# Contributor: Laramy Black <laramy2020@gmail.com>
# Contributor: Lorenzo Ferrillo <lorenzofersteam@live.it>

pkgname=diorite
pkgver=4.21.0
pkgrel=1
pkgdesc="Utility and widget library for Nuvola Player project based on GLib, GIO, and GTK"
arch=(x86_64)
url="https://tiliado.eu/diorite/"
license=(BSD)
depends=(gtk3 libgee sqlite libx11 gobject-introspection)
makedepends=(vala python-pyparsing)
source=("https://github.com/tiliado/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('74b8d36db44dc8f4607bfe9da872e5f10fa144ae63c76a8832113c109dce30c9')

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
