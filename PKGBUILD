# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=oniri-bin
_pkgname="${pkgname%-bin}"
pkgver=1.2.5
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
sha256sums=('43c50afecf55c84f82a7e439df17304d7e546bace39ec7e85f1e7fa54fb5092d'
            '346563c769e65d5f11dcdc2595cc43dec831bb98328e3d7750999e2ebb8286bc'
            'fef89be770e8351ee118b94ee7fe9233715647574858592137500d741785cb88'
            '66a4dfeb5ba8134a57bc8525b46a4408e436829daf2678f758f8f87deacf8c6a'
            'd8ba23466edd175c12ce88c8735fb08cdaa253a5eac10469e2f4c682b4a968ba')
sha256sums_x86_64=('2c4a8334c19e227c74d188c897e6cc065040f1c0142baa9ab765745aa96d65ac')

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
