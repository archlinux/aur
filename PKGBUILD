# Maintainer: Alexandre Courtois <lasalade.verte@free.fr>

pkgname=ync-tools
pkgver=0.83.5
pkgrel=1
pkgdesc="Yamaha network players control tools"
arch=('any')
url="https://github.com/Guitar-Man/ync-tools"
license=('GPL')
depends=('gtk3' 'sfml' 'tinyxml2' 'libglade' 'libconfig')
makedepends=('cmake' 'gendesk')
source=("https://github.com/Guitar-Man/ync-tools/raw/master/ync-tools-${pkgver}.tar.gz")
md5sums=('1e0d494607a204c2ba3dc1269c183a54')
#options=('!buildflags')

prepare() {
	gendesk -n --pkgname="yncc-gtk" --name="Yncc" --exec="/usr/bin/yncc-gtk" --categories="AudioVideo"
}

build() {
	cd yncapi
	cmake .
	make

	cd ../yncc
	cmake .
	make

	cd ../yncc-gtk
	cmake .
	make
}

package() {
	cd cmake-build-Release/output

	install -D -m755 "yncc" "${pkgdir}/usr/bin/yncc"
	install -D -m755 "yncc-gtk" "${pkgdir}/usr/bin/yncc-gtk"
	install -D -m755 "libyncapi.so" "${pkgdir}/usr/lib/libyncapi.so"

	install -D -m644 "../../yncapi/yncapi.h" "${pkgdir}/usr/include/yncapi.h"

	install -D -m644 "../../yncc-gtk/res/BCO_device_sm_icon.png" "${pkgdir}/usr/share/ync-tools/yncc-gtk/BCO_device_sm_icon.png"
	install -D -m644 "../../yncc-gtk/res/bg.png" "${pkgdir}/usr/share/ync-tools/yncc-gtk/bg.png"
	install -D -m644 "../../yncc-gtk/res/cd.png" "${pkgdir}/usr/share/ync-tools/yncc-gtk/cd.png"
	install -D -m644 "../../yncc-gtk/res/headphones.png" "${pkgdir}/usr/share/ync-tools/yncc-gtk/headphones.png"
	install -D -m644 "../../yncc-gtk/res/opt.png" "${pkgdir}/usr/share/ync-tools/yncc-gtk/opt.png"
	install -D -m644 "../../yncc-gtk/res/radio.png" "${pkgdir}/usr/share/ync-tools/yncc-gtk/radio.png"
	install -D -m644 "../../yncc-gtk/res/server.png" "${pkgdir}/usr/share/ync-tools/yncc-gtk/server.png"
	install -D -m644 "../../yncc-gtk/res/icon.svg" "${pkgdir}/usr/share/ync-tools/yncc-gtk/icon.svg"

	install -D -m644 "../../yncc-gtk/res/yncc-gtk.glade" "${pkgdir}/usr/share/ync-tools/yncc-gtk/yncc-gtk.glade"

	install -D -m644 "../../yncc-gtk/lang/yncc-gtk-fr.mo" "${pkgdir}/usr/share/locale/fr/LC_MESSAGES/yncc-gtk.mo"

	install -D -m644 "../../yncc-gtk.desktop" "${pkgdir}/usr/share/applications/yncc-gtk.desktop"
	install -D -m644 "../../yncc-gtk/res/icon.svg" "${pkgdir}/usr/share/pixmaps/yncc-gtk.svg"

	install -D -m644 "../../LICENSE" "${pkgdir}/usr/share/ync-tools/LICENSE"
	install -D -m644 "../../README.md" "${pkgdir}/usr/share/ync-tools/README"
}
