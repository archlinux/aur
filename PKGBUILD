# Current Maintainer: Ming Di Leom
# Previous Maintainer: John A. Leuenhagen <john@zlima12.com>
# Previous Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Vinay Shastry <vinayshastry at gmail dot com>

_pkgname='wormhole-william'
pkgname="${_pkgname}-bin"
pkgver=1.0.8
pkgrel=2
pkgdesc='Securely transfer files between devices. Go implementation of magic wormhole.'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/psanford/wormhole-william'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}-${pkgver}-README.md::${url}/raw/v${pkgver}/README.md"
        "${_pkgname}-${pkgver}-LICENSE::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64")
source_armv7h=("${_pkgname}-${pkgver}-armv7h::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm7")
source_aarch64=("${_pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64")

sha256sums=('ac9d28222e6760081504a4a6cc89d64b5185e05e7fb232e86587cd399f479fae'
            'ee47201dec4798fed875d8768ebfd04f186a74f1bbffe315a0c96b423331f462')
sha256sums_x86_64=('a6e501a9f3555617d980d8de49fb2f91783c27cfd875cb42a1ac5cf8fc11205d')
sha256sums_armv7h=('fafa84260572e00bc46d179b4857195c54ade365b7bf80669dc40dc8a6ab86ed')
sha256sums_aarch64=('d1b727288bda91463e35e0312c102d35a95c77eb638aa6567eb6f2cc6f2759e8')

prepare() {
  _wh="${_pkgname}-${pkgver}-${CARCH}"
  chmod u+x "$_wh"
  ./"$_wh" completion bash > "bash"
  ./"$_wh" completion zsh > "zsh"
  ./"$_wh" completion fish > "fish"
}

package() {
  install -Dm755 "${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}-${pkgver}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "${_pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  # Shell autocompletion script
  install -Dm644 "bash" "${pkgdir}/usr/share/bash-completion/completions/wormhole-william"
  install -Dm644 "zsh" "${pkgdir}/usr/share/zsh/site-functions/_wormhole-william"
  install -Dm644 "fish" "${pkgdir}/usr/share/fish/vendor_completions.d/wormhole-william.fish"
}
