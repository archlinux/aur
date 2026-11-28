# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=qu8n
_gitname=mddog
_appname=mdd
pkgname=${_gitname}-bin
pkgdesc="Real Markdown, right in your terminal"

pkgver=1.6.0
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
sha256sums=('44426acb6d43e88f280cd500223ff98f9aeb84ee633c0edb067dca753ae1ce58'
            '30c5c6791b321d00ab79f1acc16cf45e970f19ca47df93e90ac83dd09b5052bd')
sha256sums_x86_64=('f99354bbb117bb93c28bdb305aa80c4e47fc3a4c3f1abc66d033bbc801b4e628')
sha256sums_aarch64=('cd6770bd59153b12e2da0c3d0f2fae64877b59f1f1099842c05cc06433ecf5de')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
