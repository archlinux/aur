# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

gitauthor="funstuie-bit"
gitname="JukeboxCli"
pkgname="jukebox-cli"
appname="${pkgname//-/}"
pkgdesc="Music player that lives in the terminal. Local music, YouTube search and live radio in one queue. Download only when you choose."
pkgver=1.3.1
pkgrel=1

arch=("x86_64")
license=("MIT")
url="https://github.com/${gitauthor}/${gitname}"

makedepends=("sh" "npm" "gcc" "make" "pkgconf")
depends=("nodejs" "projectm-pulseaudio" "libpulse" "qt5-base" "mpv")

provides=("${appname}")

options=('!strip' 'emptydirs' 'staticlibs' 'zipman')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('46d5cb5699738197a526bf24463ce99487dfe89826b0a7c4f3ba9e7e79daedd090bd1e3a9f9922d7189ee582532443986553a3e56f04b2844df7843a5c19ab8e')

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
