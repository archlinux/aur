# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=manora-bin
_pkgname="${pkgname%-bin}"
pkgver=2.2.6
pkgrel=1
pkgdesc="A simple CLI & TUI tool to display, download and save man pages as PDF files (bin version)"
url="https://github.com/Antiz96/manora"
_raw_url="https://raw.githubusercontent.com/Antiz96/manora"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('man' 'groff' 'xdg-utils' 'util-linux')
makedepends=('scdoc')
optdepends=("zathura: fallback PDF reader"
            "zathura-pdf-poppler: PDF support for zathura (poppler backend)"
            "zathura-pdf-mupdf: PDF support for zathura (mupdf backend)")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip)
source=("${_pkgname}-${pkgver}.bash::${_raw_url}/v${pkgver}/res/completions/${_pkgname}.bash"
        "${_pkgname}-${pkgver}.zsh::${_raw_url}/v${pkgver}/res/completions/${_pkgname}.zsh"
        "${_pkgname}-${pkgver}.fish::${_raw_url}/v${pkgver}/res/completions/${_pkgname}.fish"
        "${_pkgname}-${pkgver}.1.scd::${_raw_url}/v${pkgver}/doc/man/${_pkgname}.1.scd"
        "README-${pkgver}.md::${_raw_url}/v${pkgver}/README.md")
source_x86_64=("${_pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64")
sha256sums=('513e952b835fbfa53afb6d38e3fd13632cd497d930510586dd903eb39927d6f8'
            '4d69bf24b06648b4f22232ecaa64f43a688dc3c3baa9036b076edb50eb7ba881'
            '5da5f43e58cf2eedc3d320620b82d744d0056160e0090bf0919148d8b77c3744'
            'f12fea17448d2c3a9deed16f56b88788bfae8c2f331a110fd9949c7fa67d6acc'
            'f66a9c7f3a5b08ab38415bd5b4f8b3f160d5a031b3b39f065f0da26b5df7e137')
sha256sums_x86_64=('d64f8e10b1839afbd2b36d405b40c8923ce27d432547a1f54ffc829a32c2d8dc')

build() {
	scdoc < "${_pkgname}-${pkgver}.1.scd" > "${_pkgname}.1"
}

package() {
	install -Dm 755 "${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm 644 "${_pkgname}-${pkgver}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
	install -Dm 644 "${_pkgname}-${pkgver}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
	install -Dm 644 "${_pkgname}-${pkgver}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
	install -Dm 644 "${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
	install -Dm 644 README-${pkgver}.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
