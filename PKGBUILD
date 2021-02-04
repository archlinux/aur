# Maintainer:
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Laramy Black <laramy2020@gmail.com>

pkgname=nuvolaruntime
pkgver=4.20.0
pkgrel=1
pkgdesc="Nuvola Apps Runtime - Tight integration of web apps with your desktop"
arch=(x86_64)
url="https://nuvola.tiliado.eu"
license=(BSD)
depends=(diorite python-gobject json-glib webkit2gtk
         libnotify gst-plugins-ugly libdri2 libpulse
         libdrm libsecret libappindicator-gtk3)
makedepends=(vala)
#optdepends=('nodejs-engine.io-client'
#            'nodejs-unit.js: for JavaScript unit tests')
#libappindicator-gtk3 is mandatory if enabled
provides=(nuvolaplayer)
conflicts=(nuvolaplayer)
source=("https://github.com/tiliado/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('9441be8f574bd9f285568261ba77c11761d02f5e5e8218cefd239e2dba61f1de')

build() {
	cd "nuvolaplayer-${pkgver}"
	./waf configure \
		--prefix=/usr \
		--libdir=/usr/lib \
        --no-appindicator \
        --dummy-engine \
		--no-vala-lint \
		--no-js-lint \
        --no-strict \
		--no-unity

	./waf build -v
}

#check() {
#	cd "nuvolaplayer-${pkgver}/build"
#	LD_LIBRARY_PATH+=:$PWD LD_PRELOAD=libnuvolaruntime-tests.so ./run-nuvolaruntime-tests 
#}

package() {
	cd "nuvolaplayer-${pkgver}"
	./waf install --destdir="${pkgdir}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
