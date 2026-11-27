# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=qu8n
_gitname=mddog
_appname=mdd
pkgname=${_gitname}-bin
pkgdesc="Real Markdown, right in your terminal"

pkgver=1.5.1
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
sha256sums_x86_64=('a05abd288d6a2c818f15d0f750136997ee34cd79e85ebbc69712cab602a54a73')
sha256sums_aarch64=('e9052549476a14d470a6bfcd293c6bc08e42538a3f34cd4069c23cd81b2fecda')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
