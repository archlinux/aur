# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: Pival81 <pival801 at gmail dot com>
#
pkgname="nemo-megasync"
pkgver="4.0.2"
pkgrel="3"
pkgdesc="MEGASync extension for the Nemo file browser"
arch=('i686' 'x86_64')
url="https://mega.co.nz/#sync"
license=('custom:The Clarified Artistic License')
depends=('hicolor-icon-theme' 'nemo' 'megasync')
provides=("${pkgname}")

source=("https://mega.nz/linux/MEGAsync/Debian_10.0/${pkgname}_${pkgver}.orig.tar.gz")

sha256sums=('d28819affd647b1fe4aab74022fa23279a36e800b11570998636387e2c4fabac')

install="${pkgname}.install"

prepare() {
    export DESKTOP_DESTDIR=${pkgdir}/usr
}

build() {
	cd "${pkgname}-${pkgver}"
	qmake-qt5 
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	install -m755 -d "${pkgdir}/usr/lib/nemo/extensions-3.0"
	install -m755 libMEGAShellExtNemo.so.1.0.0 -D "${pkgdir}/usr/lib/nemo/extensions-3.0/"

	install -m755 -d "${pkgdir}/usr/share/icons/hicolor/32x32/emblems"
	install -m755 -d "${pkgdir}/usr/share/icons/hicolor/64x64/emblems"
	install -m644 ./data/emblems/32x32/* -D "${pkgdir}/usr/share/icons/hicolor/32x32/emblems/"
	install -m644 ./data/emblems/64x64/* -D "${pkgdir}/usr/share/icons/hicolor/64x64/emblems/"
	
	cd "${pkgdir}/usr/lib/nemo/extensions-3.0/"
	ln -s "libMEGAShellExtNemo.so.1.0.0" "libMEGAShellExtNemo.so"
	ln -s "libMEGAShellExtNemo.so.1.0.0" "libMEGAShellExtNemo.so.1"
	ln -s "libMEGAShellExtNemo.so.1.0.0" "libMEGAShellExtNemo.so.1.0"
}

# vim:set ts=4 sw=4 ft=sh et syn=sh:
