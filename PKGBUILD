# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=yaroshevych
_gitname=bypass
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Modern terminal secrets manager compatible with KeePass vaults"

pkgver=0.5.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('keepassxc')

options=('!strip')

source=("CLI-${pkgver}.md::${_ghurlraw}/CLI.md"
		"TUI-${pkgver}.md::${_ghurlraw}/TUI.md"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums=('89ae0dc541a883ee8bec04450f94bb7dd314230852bebb10349c99ddbf3a2e18'
            'be8de754c9bb3f5c292360fd7b216eb277063c7cac90cb645994c5db91d76411'
            'aac3cfb4d5b8d0c031d3cc1f84f707754a8318d6d29df706566e15ac0269bed6'
            '54cf7b716c85a4a5911a09de2fe15689f6b40d1c27ca0bb6153c800f54e71570')
sha256sums_x86_64=('303c3a7730f45c374be7d5ec3740fc4320bafc617dac0e5d88761905d6ae434a')
sha256sums_aarch64=('c8612d92a0a340482b127ae0c22d73354018766a1788ccaddaec596cb510322d')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "CLI-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CLI.md"
	install -Dm644 "TUI-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/TUI.md"
	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
