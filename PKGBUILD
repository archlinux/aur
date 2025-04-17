# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Sergey Balabanov <sergey dot balabanov at gmail dot com>

_pkgauthor=aquaproj
_pkgname=aqua
pkgname=${_pkgname}-bin
pkgver=2.48.2
pkgrel=1
pkgdesc="Declarative CLI version manager"
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

sha256sums_x86_64=('7146bfa0b8e9a5aaa555a5de41cf8496cb8139974839ecfe54be48701fa156fa')
sha256sums_aarch64=('e1c77d406533807bb1e6edc02400ab4f71fdc5bd6525bff7b1f4a62fc949274f')

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
