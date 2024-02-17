# Maintainer: Victor Bonnelle <victor.bonnelle@protonmail.com>

pkgname=ungit-electron
pkgver=1.5.25
pkgrel=0
pkgdesc="The easiest way to use git. On any platform. Anywhere. (Electron version)"
arch=('x86_64')
url='https://github.com/FredrikNoren/ungit'
license=('MIT')
conflicts=('ungit')
source=(
	"https://github.com/FredrikNoren/ungit/releases/download/v${pkgver}/ungit-${pkgver}-linux-x64.zip"
	"https://raw.githubusercontent.com/FredrikNoren/ungit/v${pkgver}/LICENSE.md"
	"https://raw.githubusercontent.com/FredrikNoren/ungit/v${pkgver}/assets/images/icon.svg"
	'ungit.desktop'
)
md5sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
)

package() {
	# Install license
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	install "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Install shortcut
	mkdir -p "${pkgdir}/usr/share/applications"
	install "${srcdir}/ungit.desktop" "${pkgdir}/usr/share/applications/ungit.desktop"

	# Install folder
	mkdir -p "${pkgdir}/opt"
	cp -r "${srcdir}/ungit-linux-x64" "${pkgdir}/opt/${pkgname}"

	# Install icon
	install "${srcdir}/icon.svg" "${pkgdir}/opt/${pkgname}/"

	# Link command
	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/ungit" "${pkgdir}/usr/bin/ungit"
}
