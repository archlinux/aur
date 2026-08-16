# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=aps-bin
_pkgname="${pkgname%-bin}"
pkgver=1.3.2
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
            '4081e6743d7ad46929516fa07099654a049e9d4200f597c153ca0e956747b39d'
            '90884e15d4cd08db33eca45496228f082808641bfd17db5c00806efe2651aa7c')
sha256sums_x86_64=('36435492534a51efc7c53b9d7b19cd3c6e87742c178e1db2f30856d77e2349a9')

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
