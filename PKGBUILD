# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=convco
_gitname=convco
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Conventional commits, changelog, versioning, validation"

pkgver=0.6.4
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('ubuntu' 'ubuntu-aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("SHELL-COMPLETIONS-${pkgver}.zip::${_ghurl}/releases/download/${_gitversion}/${_appname}-shell-completions.zip"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.zip")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.zip")
sha256sums=('1a6fde95f7f5ba1db91bdfe4ea1bf0baeeabc965450d7f2e55ffc9f2788e0123'
            'b94dedebb21b09be8d6a8a02bb5ad6fa3a3c74cd984c168817d0bbd241d8fdd7'
            '8556414d9b301f1291d3399bbe3745b105006fa282c760287e5511778ec0bbef')
sha256sums_x86_64=('d6e43a1975949ef05d31bb1ac64fdd7c2dbc18b0b65df075c16dc296b8153be7')
sha256sums_aarch64=('1e626914c90cf60314a8ef50d97566ebabb0ad5daf405fa7e4ca3193df1c73c3')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "${_appname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_appname}.fish"
	install -Dm644 "${_appname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appname}"
	install -Dm644 "_${_appname}" "${pkgdir}/usr/share/zsh/site-functions/_${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
