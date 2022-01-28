# Maintainer: Ranadeep B < mail at rnbguy dot at >

_orgname=informalsystems
_reponame=ibc-rs
_basename=hermes
_pkgname=${_basename}-relayer
pkgname=${_pkgname}-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="Hermes IBC Relayer"
arch=('x86_64')
url="https://${_basename}.informal.systems/"
license=('Apache')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("https://raw.githubusercontent.com/${_orgname}/${_reponame}/v${pkgver}/LICENSE")
source_x86_64=("https://github.com/${_orgname}/${_reponame}/releases/download/v${pkgver}/${_basename}-v${pkgver}-${arch}-unknown-linux-gnu.tar.gz")
sha256sums=('1816dfba29b8182ddffbc675e228906b2acaa338fcaada5e330065e650092689')
sha256sums_x86_64=('3c5ea3e3b66d305323540bef3856716f18165c76afad435dfaa0bdf6e81550d2')

package() {
    install -D "${_basename}" "${pkgdir}/usr/local/bin/${_pkgname}"

    # Generate completion files.
    mkdir -p "${pkgdir}/usr/share/bash-completion/completions"
    "${pkgdir}/usr/local/bin/${_pkgname}" completions bash > "${pkgdir}/usr/share/bash-completion/completions/hermes-relayer"
    mkdir -p "${pkgdir}/usr/share/fish/vendor_completions.d"
    "${pkgdir}/usr/local/bin/${_pkgname}" completions fish > "${pkgdir}/usr/share/fish/vendor_completions.d/hermes_relayer.fish"
    mkdir -p "${pkgdir}/usr/share/zsh/site-functions"
    "${pkgdir}/usr/local/bin/${_pkgname}" completions zsh > "${pkgdir}/usr/share/zsh/site-functions/_hermes_relayer"

    install -m644 -Dt "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE
}
