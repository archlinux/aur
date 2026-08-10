# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=oniri-bin
_pkgname="${pkgname%-bin}"
pkgver=1.3.4
pkgrel=1
pkgdesc="A tool that automatically maximizes the only window of a niri workspace (bin version)"
url="https://github.com/Antiz96/oniri"
_raw_url="https://raw.githubusercontent.com/Antiz96/oniri"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('niri')
makedepends=('scdoc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip)
source=("${_pkgname}-${pkgver}.bash::${_raw_url}/v${pkgver}/res/completions/${_pkgname}.bash"
        "${_pkgname}-${pkgver}.zsh::${_raw_url}/v${pkgver}/res/completions/${_pkgname}.zsh"
        "${_pkgname}-${pkgver}.fish::${_raw_url}/v${pkgver}/res/completions/${_pkgname}.fish"
        "${_pkgname}-${pkgver}.1.scd::${_raw_url}/v${pkgver}/doc/man/${_pkgname}.1.scd"
        "README-${pkgver}.md::${_raw_url}/v${pkgver}/README.md")
source_x86_64=("${_pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64")
sha256sums=('cb77b0ac58f40072cc66016548d7d8226a699992e3e9a6ae9f629613a7483a50'
            '005b20272ab00c13b839d9073dd3f0031422ac0debe937824a64640d630e6158'
            '449a7e4febc5bf0ea926dbfcd1623c9861423ec2aa54eda5200c26e03de42926'
            '500939320321415aa5c9ab6afeade8459b0b614f43baf0f679c447d06f1b3bf8'
            'd8ba23466edd175c12ce88c8735fb08cdaa253a5eac10469e2f4c682b4a968ba')
sha256sums_x86_64=('f211a19cc7d0e53fd3b996af9a7e974be1cc90a5eaafa658d1421dafc8a36350')

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
