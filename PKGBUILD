# Maintainer:  Moritz Lüdecke <ritze@skweez.net>
# Contributor: Maxim 'maximbaz' Baz
# Contributor: Håvard Pettersson <mail@haavard.me>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Jeff 'codemac' Mickey <jeff@archlinux.org>

pkgname=pinentry-dmenu
pkgver=0.2.1
pkgrel=1
pkgdesc="A pinentry program with the charm of dmenu"
url="https://github.com/ritze/pinentry-dmenu"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('sh' 'libconfig'  'libxinerama' 'libxft')
provides=('pinentry')
source=(https://github.com/ritze/pinentry-dmenu/archive/$pkgver.zip)
sha256sums=('c3150ef052ab3362155a0f69da91221fe5ec27a2cddafe0ce1298a026acab63e')

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
}
