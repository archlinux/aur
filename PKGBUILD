# Maintainer: Denis Falqueto <denisfalqueto@gmail.com>
__pkgbasename=wxWidgets
pkgbase=wxwidgets3.0
pkgname=${pkgbase}
pkgver=3.0.5
pkgrel=2
pkgdesc="GTK+3 implementation of wxWidgets API for GUI"
arch=('x86_64')
url="https://wxwidgets.org/"
license=('custom:wxWindows')
depends=('gtk3' 'gst-plugins-base-libs' 'libsm' 'wxwidgets-common' 'libnotify' 'libmspack' 'sdl2')
optdepends=('webkit2gtk: for webview support')
source=("https://github.com/${__pkgbasename}/${__pkgbasename}/releases/download/v${pkgver}/wxWidgets-${pkgver}.tar.bz2")
sha256sums=('8aacd56b462f42fb6e33b4d8f5d40be5abc3d3b41348ea968aa515cc8285d813')

build() {
	cd "$__pkgbasename-$pkgver"
	./configure --prefix=/usr --with-gtk=3
	make
}

package() {
	cd "$__pkgbasename-$pkgver"
	make DESTDIR="$pkgdir/" install

	# Remove files that should be only on official package
	rm $pkgdir/usr/bin -fr
	rm $pkgdir/usr/share -fr
}
