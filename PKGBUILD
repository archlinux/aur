# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=paviro
_gitname=Notema
_appname=${_gitname,,}
pkgname=${_appname}-bin
pkgdesc="A terminal-based Markdown journaling app"

pkgver=2026.8.0
pkgrel=1
_gitversion=${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-gnu-x86_64' 'linux-gnu-aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('EUPL-1.2')

depends=('glibc')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENCE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.zip::${_ghurl}/releases/download/${_gitversion}/${_barch[0]}.zip")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.zip::${_ghurl}/releases/download/${_gitversion}/${_barch[1]}.zip")
sha256sums=('ab7cee085d596279a0a8684f21dbe5322c3f8c1446f0f21f5111e3cb4a239eff'
            '6fc9e709ccbfe0d77fbffa2427a983282be2eb88e47b1cdb49f21a83b4d1e665')
sha256sums_x86_64=('9c4466c9b1186e7bcb06934b9d5ff7549af5c1318ce58a2526903713ed3c835c')
sha256sums_aarch64=('257f62a8f4e82fe7b9a807f508281e413ca4905f959564bb5c7845b16e4f758e')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
