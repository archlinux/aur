# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=aps-bin
_pkgname="${pkgname%-bin}"
pkgver=1.3.1
pkgrel=1
pkgdesc="A fast and powerful patterns searcher for AUR package sources (bin version)"
url="https://github.com/Antiz96/aps"
_raw_url="https://raw.githubusercontent.com/Antiz96/aps"
arch=('x86_64')
license=('GPL-3.0-or-later')
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
sha256sums=('ae2cf86bdfb69f473f673d38835badfe0572b742f3ade2beb4dfce8c73560de9'
            '6e5336b41889014e3d97de9fe362b9abf3f41a8baab92900874a3ed81a93e7b1'
            '91bec3773e904d6aead58580c87bc57411c2cef59449d1376be84d21064b5cca'
            '17287e50294a22133cee7f597d28a7bdb41bbe30051387cdb1578b640096b2dd'
            '5470a369e1208a2971c49f5e2270f96928d442e9b8239dc98279d1cbf2aac06a')
sha256sums_x86_64=('4b5f29a292c62e03ae13590d8f6c5f83eaac6cf135f2f65e6d6995904919ef42')

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
