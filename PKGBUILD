# Maintainer: Joel Teichroeb <joel@teichroeb.net>

pkgname=libinput-git
pkgver=1.5.2.r66.g91467f7
pkgrel=1
pkgdesc='A library to handle input devices in Wayland compositors'
arch=(i686 x86_64)
url='http://freedesktop.org/wiki/Software/libinput/'
provides=("libinput=${pkgver}")
license=('MIT')
depends=('mtdev' 'systemd' 'libevdev' 'libwacom')
makedepends=('git')
conflicts=('libinput')
source=(git://anongit.freedesktop.org/wayland/libinput)
sha1sums=('SKIP')

pkgver() {
	cd libinput
	git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd libinput

	./autogen.sh --prefix=/usr --disable-static
	make
}

package() {
	cd libinput
	make DESTDIR="${pkgdir}" install

	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	# install doc - no Makefile target
	install -v -dm755 ${pkgdir}/usr/share/doc/libinput
	cp -rv doc/html/* ${pkgdir}/usr/share/doc/libinput
}
