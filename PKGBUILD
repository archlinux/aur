# Maintainer:
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Laramy Black <laramy2020@gmail.com>

pkgname=nuvolaruntime
pkgver=4.23.0
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
source=("https://github.com/tiliado/$pkgname/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('afc5115383410ab1207bd9e1d9ceab31c312100c11343239b1e4cac4588a6f31')

build() {
	cd "nuvolaplayer-${pkgver}"
	./waf configure \
		--prefix=/usr \
		--libdir=/usr/lib \
        --dummy-engine \
        --no-appindicator \
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
