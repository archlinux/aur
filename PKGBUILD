# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Sergey Balabanov <sergey dot balabanov at gmail dot com>

_pkgauthor=aquaproj
_pkgname=aqua
pkgname=${_pkgname}-bin
pkgver=2.42.2
pkgrel=1
pkgdesc="Declarative CLI Version manager written in Go"
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
depends=()
optdepends=()

install=aqua-bin.install

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_linux_arm64.tar.gz")

sha256sums_x86_64=('1261c8a5fdb1d6f27b473151085b35f03ac63e3a38e6dcdb64fcf220afe8a1d9')
sha256sums_aarch64=('b8b4212f750de3d04bc2b515b4d246d99bd5bed9be97580a2e887a52b9079087')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  _output="${srcdir}/output"
  mkdir -p "${_output}"

  "${srcdir}/${_pkgname}" completion bash > "${_output}/bash"
  "${srcdir}/${_pkgname}" completion zsh > "${_output}/zsh"
  "${srcdir}/${_pkgname}" completion fish > "${_output}/fish"

  # Shell autocompletion script
  install -Dm644 "${_output}/bash" "${pkgdir}/usr/share/bash-completion/completions/aqua"
  install -Dm644 "${_output}/zsh" "${pkgdir}/usr/share/zsh/site-functions/_aqua"
  install -Dm644 "${_output}/fish" "${pkgdir}/usr/share/fish/vendor_completions.d/aqua.fish"
}
