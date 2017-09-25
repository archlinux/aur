# Maintainer:  Moritz Lüdecke <ritze@skweez.net>
# Contributor: Håvard Pettersson <mail@haavard.me>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Jeff 'codemac' Mickey <jeff@archlinux.org>

pkgname=pinentry-dmenu
pkgver=0.1
pkgrel=1
pkgdesc="A pinentry program with the charm of dmenu"
url="https://github.com/ritze/pinentry-dmenu"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('sh' 'libxinerama' 'libxft')
source=(https://github.com/ritze/pinentry-dmenu/archive/$pkgver.zip)
sha256sums=('81432339d415b87b8e68bfde8048b689d92ef4c5c444d16589f5e60de59493ad')

prepare() {
	cd $pkgname-$pkgver
	# to use a custom config.h, place it in the package directory
	if [[ -f ${SRCDEST}/config.h ]]; then
		cp "${SRCDEST}/config.h" .
	fi
}

build(){
	cd $pkgname-$pkgver
	make \
		X11INC=/usr/include/X11 \
		X11LIB=/usr/lib/X11
}

package() {
	cd $pkgname-$pkgver
	make PREFIX=/usr DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
