# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

gitauthor="funstuie-bit"
gitname="JukeboxCli"
pkgname="jukebox-cli"
appname="${pkgname//-/}"
pkgdesc="Music player that lives in the terminal. Local music, YouTube search and live radio in one queue. Download only when you choose."
pkgver=1.0.2
pkgrel=1

arch=("x86_64")
license=("MIT")
url="https://github.com/${gitauthor}/${gitname}"

depends=("nodejs")
makedepends=("sh" "npm")

provides=("${appname}")

options=('!strip' 'emptydirs' 'staticlibs' 'zipman')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('610f131481425a3e3bfb83b461b0cf6e5327ecae3fa4689124f9fa1586f3deeff7bcc937d8221a1883b19d5f36fd5b738cbecb887679c15e857957d6a6db0c96')

# Document: https://wiki.archlinux.org/title/Node.js_package_guidelines
package() {
	cd "${srcdir}/${gitname}-${pkgver}/"

	./install.sh --prefix "${pkgdir}/usr"

	msg2 "Install README file"
	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
	ln -sf "/usr/lib/node_modules/${appname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	msg2 "Install LICENSE file"
	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
	ln -sf "/usr/lib/node_modules/${appname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
