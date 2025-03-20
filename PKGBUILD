# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="phylum"
pkgname="${_pkgname}-bin"
pkgver=7.4.0
pkgrel=1
pkgdesc="Command line interface for the Phylum API"
arch=('aarch64' 'x86_64')
url="https://phylum.io"
_url="https://github.com/phylum-dev/cli"
license=('MIT')
depends=('gcc-libs' 'glibc' 'zlib')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64.zip::${_url}/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.zip")
source_x86_64=("${_pkgsrc}-x86_64.zip::${_url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.zip")
b2sums=('112db7a875f7ae8d5e4b5d1dad07e95c75607ca3fcb907d64e3f7b270734a8ffa6d403f1e82714f13847275c46c45473c29bda44ade8f4fbc4fe2948f7b20050'
        'd23d56095390a883bd5c4a2fd321bfe027477e24222332936f15c2653614efe93322776f9c6011102fd33210079a01edaa22ffb2326ca5187a6bf9bc50d7ca7e')
b2sums_aarch64=('969a60b33e208d7c8bdcd687f86d3a24a34ac7c4e50666872a09e8558f0ac6181bd0d8cb468ecfc61673a2e988089222d2cfb2b88f4f4435cbcd60ad215785f6')
b2sums_x86_64=('33f0985861de1fbaeb886606a78bc98b21a6779c797462803e53fc625c3a71bc79ce2f9e497c17a0203a4150f6f046691e616cefdac836240b8a71081ad595af')

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "${_pkgname}-${CARCH}-unknown-linux-gnu"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  cd "completions"
  install -vDm644 "${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -vDm644 "${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -vDm644 "_${_pkgname}"     "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
