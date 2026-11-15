# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=yaroshevych
_gitname=bypass
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Modern terminal secrets manager compatible with KeePass vaults"

pkgver=0.3.2
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
sha256sums=('d74625fb5ca53d41f7332b0591fa54eca5779a3ad143a48e00cf9d3869688e2d'
            '9f1bf0d6eb64653651346cf9fb4605f3f7f9265ff8abc22dd3d3bd427e9a238a'
            '50f5e52d2345968ab9668a72ef405bc7a24a8e22e32bc3a3cdbe2748068266a8'
            '54cf7b716c85a4a5911a09de2fe15689f6b40d1c27ca0bb6153c800f54e71570')
sha256sums_x86_64=('04e4e3ef84b1b9c038fe8b9aaf91b5cd4b0b0e14147baf9d26af0ea635c28c3e')
sha256sums_aarch64=('b12ec471ebefef0c6cf55b1ebfedba174e1e132045ca7dedc417839dbf3fecb8')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "CLI-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CLI.md"
	install -Dm644 "TUI-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/TUI.md"
	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
