# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=qu8n
_gitname=mddog
_appname=mdd
pkgname=${_gitname}-bin
pkgdesc="Real Markdown, right in your terminal"

pkgver=1.5.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('b15ddd96556c96772b6689cac4c2c53f6424420f2d5264a61e087031a893ed99'
            '30c5c6791b321d00ab79f1acc16cf45e970f19ca47df93e90ac83dd09b5052bd')
sha256sums_x86_64=('0902559cb2c3120f605d73f5518002e7db76ea24e4d3f54d6c3377ab095b6fd7')
sha256sums_aarch64=('a8c212cdc001d49f8b9a7cff1eeb58dd137c92bb21ba44451ec4469e58906464')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
