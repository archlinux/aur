# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Maintainer: Robin Candau <antiz@archlinux.org>


_gitauthor=Antiz96
_gitname=manora
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A simple CLI / TUI tool to display, download and save man pages as PDF files (bin version)"

pkgver=2.1.0
pkgrel=2
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0-or-later')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('man' 'groff' 'xdg-utils')
makedepends=('scdoc')
optdepends=("zathura: fallback PDF reader"
            "zathura-pdf-poppler: PDF support for zathura (poppler backend)"
            "zathura-pdf-mupdf: PDF support for zathura (mupdf backend)")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"${_appname}-${pkgver}.1.scd::${_ghurlraw}/doc/man/manora.1.scd"
		"${_appname}-${pkgver}.bash::${_ghurlraw}/res/completions/manora.bash"
		"${_appname}-${pkgver}.zsh::${_ghurlraw}/res/completions/manora.zsh"
		"${_appname}-${pkgver}.fish::${_ghurlraw}/res/completions/manora.fish")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}")
sha256sums=('2f81fb0bf2e24128b3dbcc53a16fbe2606aaa178b06cb1693cba81ba5d915c69'
            'e67270898a4120d54f36e4343eeec1382a1ed831064e82115f6b45dab4d9d825'
            '513e952b835fbfa53afb6d38e3fd13632cd497d930510586dd903eb39927d6f8'
            'b21cb8f76eb690edbefee16f18eb4edd7853cefedee8b3d91edc23b2407732de'
            '7f5973255a18af6e1de61cc53d9161ac74e3e6ac3b4f9b885a7ebc6b145c0807')
sha256sums_x86_64=('cd32bab86d4cf5926ef2642e84ac76dd172e6bfdf72e40f0b7934a832bbf7b7d')

build() {
       cd "${srcdir}/" || exit

       scdoc < "${_appname}-${pkgver}.1.scd" > "${_appname}-${pkgver}.1"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_appname}/README.md"

	install -Dm644 "${_appname}-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_appname}.1"

	install -Dm644 "${_appname}-${pkgver}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appname}"
	install -Dm644 "${_appname}-${pkgver}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_appname}"
	install -Dm644 "${_appname}-${pkgver}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_appname}.fish"
}
