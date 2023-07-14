# Maintainer: koonix <me@koonix.org>
# Contributor: Moritz Lüdecke <ritze@skweez.net>
# Contributor: Maxim 'maximbaz' Baz
# Contributor: Håvard Pettersson <mail@haavard.me>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Jeff 'codemac' Mickey <jeff@archlinux.org>

pkgname=pinentry-dmenu
pkgver=0.2.2
pkgrel=2
pkgdesc="A pinentry program with the charm of dmenu"
url="https://github.com/ritze/pinentry-dmenu"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('sh' 'libconfig'  'libxinerama' 'libxft')
provides=('pinentry' 'dmenu-pinentry')
conflicts=('pinentry-dmenu-inco')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('7b29b79e7c3b5c00d1f3320aa522e88064b1e366542bb94735905cabcf3d4c62')

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
