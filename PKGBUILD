# Maintainer: Bazyli Cyran <bazyli@cyran.dev>

_pkgname=bumper
pkgname="${_pkgname}-bin"
pkgver=1.0.2
pkgrel=1
pkgdesc='Easily bump $pkgver in your AUR packages.'
url='https://github.com/bcyran/bumper'
provides=('bumper')
conflicts=('bumper')
license=('MIT')
arch=('x86_64')
source=("${_pkgname}-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.tar.gz")
sha256sums=('318bd4348fba26ca52cbd0ef001c1c5ad9ebdaa699539a26bb66c102ed525d31')

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
