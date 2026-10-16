# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

gitauthor="funstuie-bit"
gitname="JukeboxCli"
pkgname="jukebox-cli"
appname="${pkgname//-/}"
pkgdesc="Music player that lives in the terminal. Local music, YouTube search and live radio in one queue. Download only when you choose."
pkgver=1.6.0
pkgrel=1

arch=("x86_64")
license=("MIT")
url="https://github.com/${gitauthor}/${gitname}"

makedepends=("sh" "npm" "gcc" "make" "pkgconf")
depends=("nodejs" "projectm-pulseaudio" "libpulse" "qt5-base" "mpv")

provides=("${appname}")

options=('!strip' 'emptydirs' 'staticlibs' 'zipman')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('2cbf797bf3185a665982b10ad6acb0a105ca2a9e5471a51d37880e08cc14cf7c8d3abf6743d04395a4e0878c859226fa686dfd4f75e05930ff389e25fd88ab33')

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
