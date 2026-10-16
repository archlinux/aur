# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

gitauthor="funstuie-bit"
gitname="JukeboxCli"
pkgname="jukebox-cli"
appname="${pkgname//-/}"
pkgdesc="Music player that lives in the terminal. Local music, YouTube search and live radio in one queue. Download only when you choose."
pkgver=1.7.0
pkgrel=1

arch=("x86_64")
license=("MIT")
url="https://github.com/${gitauthor}/${gitname}"

makedepends=("sh" "npm" "gcc" "make" "pkgconf")
depends=("nodejs" "projectm-pulseaudio" "libpulse" "qt5-base" "mpv")

provides=("${appname}")

options=('!strip' 'emptydirs' 'staticlibs' 'zipman')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('998d75effc4b1d685fe36dae0b712e2955c16a8b8ca5d07ce42f83e2d63c6868124d2b6aa8188c8027140abdbba15c36f11ad772abf40990d1fc16f695f3ac6f')

# Document: https://wiki.archlinux.org/title/Node.js_package_guidelines
package() {
	cd "${srcdir}/${gitname}-${pkgver}/"

	./install.sh --prefix "${pkgdir}/usr" --with-cream-of-the-crop --no-system-deps

	msg2 "Install README file"
	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
	ln -sf "/usr/lib/node_modules/${appname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	msg2 "Install LICENSE file"
	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
	ln -sf "/usr/lib/node_modules/${appname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
