# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=nickprotop
_gitname=cxpost
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A cross-platform TUI mail client built with SharpConsoleUI"

pkgver=0.0.9
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'libstdc++')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('bdebde85bdf05c95fddbcfdd0fa1646432470a09b97e267334104ba832878cf7'
            'c5d50f2ab68a8939a4c0986e3ab5f9fe21f5f8b525f013f72680a2198b14ee73')
sha256sums_x86_64=('5f873b80ec09a91f811b6c67121ba1ece585433656289dacd9cc33242d3923cc')
sha256sums_aarch64=('8520e310997e73f6f7d262c689dd5ded1ba0b0ff75fe085dee3e09cb242709ec')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
