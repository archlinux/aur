# Maintainer: Kaleb Klein <klein.jae@gmail.com>

pkgname=checkmate-git
pkgver=2.1.4
pkgrel=1
pkgdesc="GUI application for verifying and generating checksums"
arch=(any)
license=('LGPL')
url="http://github.com/pazuzu156/checkmate"
depends=('qt5-base' 'qt5-webkit')
source=('git://github.com/pazuzu156/checkmate.git')
md5sums=('SKIP')

package() {
	cd "$srcdir/checkmate"
	make -f Makefile.nix

	install -D -m755 "${srcdir}/checkmate/src/Checkmate" "${pkgdir}/opt/checkmate/Checkmate"
	install -D -m755 "${srcdir}/checkmate/updater_src/CheckmateUpdater" "${pkgdir}/opt/checkmate/CheckmateUpdater"

	install -D -m644 "${srcdir}/checkmate/src/gear.png" "${pkgdir}/usr/share/icons/checkmate_icon.png"
	install -D -m644 "${srcdir}/checkmate/checkmate.desktop" "${pkgdir}/usr/share/applications/checkmate.desktop"
}

post_install() {
	ln -s /opt/checkmate/Checkmate /usr/bin/checkmate
}

post_remove() {
	rm /usr/bin/checkmate
}