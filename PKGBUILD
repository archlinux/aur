# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Drackrath
_gitname=Aurelia
_appname=${_gitname,,}
pkgname=${_appname}-bin
pkgdesc="A fast, lightweight, command-line Steam launcher and library manager written in Rust"

pkgver=0.1.17
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_x86_64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT' 'GPL-3.0')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'xz' 'bzip2' 'openssl')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"USAGE-${pkgver}.md::${_ghurlraw}/USAGE.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[1]}")
sha256sums=('f0ddbda1ea72a467450a0bbffdb07228db6713fe5ba41e3cddd51050cfaf5877'
            '056f30e83438222f9198414b8a9bb89b90e86a2f15f76fdb259948fcd6a0c773'
            'f2be9195b5ecdd8f2b71db80d4794361f90a2bdb91894f3c811f025c6578db5b')
sha256sums_x86_64=('fbdb5c0975af6a122d8a0a55d39d92da86f8ce33ebca43e7aebbf4c35c6f3e53')
sha256sums_aarch64=('ff3c1239e44b0b75c52dd50893c145ebd407166978bf54341c7f3ce990b368ec')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "USAGE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/USAGE.md"
	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
