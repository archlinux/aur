# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=lungo-bin
_pkgname="${pkgname%-bin}"
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple systray applet to prevent your system from going idle or sleeping on demand (bin version)"
url="https://github.com/Antiz96/lungo"
_raw_url="https://raw.githubusercontent.com/Antiz96/lungo"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('systemd' 'hicolor-icon-theme')
makedepends=('scdoc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip)
source=("${_pkgname}-${pkgver}-off.svg::${_raw_url}/v${pkgver}/res/icons/${_pkgname}-off.svg"
        "${_pkgname}-${pkgver}-on.svg::${_raw_url}/v${pkgver}/res/icons/${_pkgname}-on.svg"
        "${_pkgname}-${pkgver}.desktop::${_raw_url}/v${pkgver}/res/desktop/${_pkgname}.desktop"
        "${_pkgname}-${pkgver}.bash::${_raw_url}/v${pkgver}/res/completions/${_pkgname}.bash"
        "${_pkgname}-${pkgver}.zsh::${_raw_url}/v${pkgver}/res/completions/${_pkgname}.zsh"
        "${_pkgname}-${pkgver}.fish::${_raw_url}/v${pkgver}/res/completions/${_pkgname}.fish"
        "${_pkgname}-${pkgver}.1.scd::${_raw_url}/v${pkgver}/doc/man/${_pkgname}.1.scd"
        "README-${pkgver}.md::${_raw_url}/v${pkgver}/README.md")
source_x86_64=("${_pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64")
sha256sums=('9db933d7991c233f434f4f51a09b5fbbb92b1b6a7f880dbabfa30415e8898808'
            '1f6491c754fa2f374d70890771a6ae14e2922659e157595c4c951c89b96c02db'
            'b9cf8c252331f4a44ef483e0ef75838fb5b9095be14fe668f2a46604b2dafcf6'
            '629c04d6caee11a6783e9fd93c9b183edb1461164332abfd1bd16b5386ef53ca'
            '6cf4589aca0ffa81287f388202903c3005185ce41d660d68ec799f4c91cf8044'
            '3b313c2bf3138664a62c35453e2b11d4c06dae756ffb0d33a1efbb45feece39e'
            'fc821e710f850232d20b63d007527525849fbaf4c8bcb720606d39da5a6497dd'
            '786721af956c0a9dd5792006a720e1a46f89b88521b28562118cd01f1586ef83')
sha256sums_x86_64=('e00f36698a33e3fdec5ea4970db2d7a8cc185b1f4d0b973642257f94fba26a83')

build() {
	scdoc < "${_pkgname}-${pkgver}.1.scd" > "${_pkgname}.1"
}

package() {
	install -Dm 755 "${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm 644 "${_pkgname}-${pkgver}-off.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}-off.svg"
	install -Dm 644 "${_pkgname}-${pkgver}-on.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}-on.svg"
	install -Dm 644 "${_pkgname}-${pkgver}.desktop" "${pkgdir}/etc/xdg/autostart/${pkgname}.desktop"
	install -Dm 644 "${_pkgname}-${pkgver}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
	install -Dm 644 "${_pkgname}-${pkgver}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
	install -Dm 644 "${_pkgname}-${pkgver}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
	install -Dm 644 "${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
	install -Dm 644 README-${pkgver}.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
