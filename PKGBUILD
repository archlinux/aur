# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: dibblethewrecker dtw.at.jiwe.dot.org

pkgname=checkgmail
pkgver=1.15
pkgrel=1
pkgdesc="An alternative Gmail Notifier for Linux and other *nix systems"
arch=('any')
url="http://checkgmail.sourceforge.net"
license=('GPL')
depends=('perl-gtk2-trayicon' 'perl-lwp-protocol-https' 'perl-xml-simple' 'perl-freezethaw' 'perl-crypt-simple' 'perl-crypt-blowfish')
makedepends=('gendesk')
optdepends=('perl-gtk2-sexy')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}pre2.tar.bz2)
md5sums=('41532e5341d72139b8a6c922d52e7dc9')

prepare() {
	cd ${pkgname}-code

	gendesk --pkgname=$pkgname --pkgdesc='Checks a Gmail account for new mail' \
		--categories='Network;Email'
}

package() {
	cd ${pkgname}-code

	install -D -m 755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
	install -D -m 644 man/${pkgname}.1.gz \
		${pkgdir}/usr/share/man/man1/${pkgname}.1.gz

	# freedesktop
	install -D -m 644 ${pkgname}.desktop \
		${pkgdir}/usr/share/applications/${pkgname}.desktop
	install -D -m 644 ${pkgname}.png \
		${pkgdir}/usr/share/pixmaps/${pkgname}.png
}
