# Maintainer: surefire <surefire@cryptomile.net>

_pkgname=ghetto-skype
pkgname=ghetto-skype-git
pkgver=v1.3.2.r8.gf66cb2f
pkgrel=1
pkgdesc="Are you tired of a buggy 32 bit official Skype client? Then Ghetto Skype is for you!"
arch=("any")
url="https://github.com/stanfieldr/ghetto-skype"
license=("GPLv3")
depends=("electron" "hicolor-icon-theme" "npm")
conflicts=("${_pkgname}")
source=("${pkgname}::git+https://github.com/stanfieldr/ghetto-skype.git"
	"desktop"
	"sh")

md5sums=('SKIP'
         'd64f8096b45034b1af93134cfdaaeece'
         'a3a1b0db9f82c4893b99ad03ab2b9b94')

install="install"

pkgver() {
	cd "${pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}"
	rm -r "${pkgdir}/usr/etc"

	install -Dm0644 "desktop" "${pkgdir}/usr/share/applications/ghetto-skype.desktop"
	install -Dm0755 "sh" "${pkgdir}/usr/bin/ghetto-skype"

	cd "${pkgname}"

	install -Dm0644 "assets/tray/skype.png" "${pkgdir}/usr/share/pixmaps/ghetto-skype.png"

	install -dm0755 "${pkgdir}/usr/share/licenses/${_pkgname}"
	ln -s "/usr/lib/node_modules/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
