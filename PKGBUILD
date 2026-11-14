# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=yutat23
_gitname=lsoff
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="CLI / TUI that lists listening TCP/UDP ports"

pkgver=0.1.6
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('ecc209bff8612a6837dfdb9a4530de35ce5e8890a5d84a41cd1ac5e9f296ffc8'
            '8fa6650c7c9bea4113c2981b4859e8b547ef5ceae3747d5aa3f5d2d7e6a5bad1')
sha256sums_x86_64=('e720e2e12ebe76df450810321ba2e2f2c509d1acdeef37658d4cbbb2b384e733')
sha256sums_aarch64=('a1d50684fe50fc17418b3cbf12bf514042142796b9dad386d317982752a0e360')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
