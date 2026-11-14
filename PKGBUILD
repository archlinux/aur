# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

gitauthor="funstuie-bit"
gitname="JukeboxCli"
pkgname="jukebox-cli"
appname="${pkgname//-/}"
pkgdesc="Music player that lives in the terminal. Local music, YouTube search and live radio in one queue. Download only when you choose."
pkgver=1.9.0
pkgrel=1

arch=("x86_64")
license=("MIT")
url="https://github.com/${gitauthor}/${gitname}"

makedepends=("sh" "npm" "gcc" "make" "pkgconf")
depends=("nodejs" "projectm-pulseaudio" "libpulse" "qt5-base" "mpv")

provides=("${appname}")

options=('!strip' 'emptydirs' 'staticlibs' 'zipman')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('aa7480155c61efb557fc1e24f407b7f5d0625f78b9105e888b40ad72647e433145a80481e008f5448df054a8c70ad1b8b7a91c478b51d54688bac8ff834315b4')

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
