# Maintainer: Bazyli Cyran <bazyli@cyran.dev>

_pkgname=bumper
pkgname="${_pkgname}-bin"
pkgver=1.0.1
pkgrel=1
pkgdesc='Easily bump $pkgver in your AUR packages.'
url='https://github.com/bcyran/bumper'
provides=('bumper')
conflicts=('bumper')
license=('MIT')
arch=('x86_64')
source=("${_pkgname}-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.tar.gz")
sha256sums=('a97c43b5db089197529428157b88a7251e7ac6f658a6870da479ebd78e11a4ce')

build() {
    mkdir -p completions
    "./${_pkgname}" --completion bash > "completions/${_pkgname}"
    "./${_pkgname}" --completion zsh > "completions/_${_pkgname}"
    "./${_pkgname}" --completion fish > "completions/${_pkgname}.fish"
}

package() {
    install -Dm 755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
    install -Dm 644 "completions/${_pkgname}" -t "${pkgdir}/usr/share/bash-completion/completions"
    install -Dm 644 "completions/_${_pkgname}" -t "${pkgdir}/usr/share/zsh/site-functions"
    install -Dm 644 "completions/${_pkgname}.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d"
}
