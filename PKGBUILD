# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=pelazas
_gitname=p2pmux
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Multiplayer terminal multiplexer where multiple users and machines can connect to a same session"

pkgver=0.1.17
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('51902173ccbf22f9806d2739f6784689b172701734f662f32dff05fdf60fc005'
            '5519ced3c2efd392b25ccfd59c9cc9ba8c67d2348d53115a7881a4276c988018')
sha256sums_x86_64=('43718483240245836e697fbe9f145aea9ecf529316a0ceed369e828a6dc87c68')
sha256sums_aarch64=('41a6e43f6f0b03bcc7277ad8095855b7c6165c9653db78a5ccb59d145ddae22c')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
