# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Sergey Balabanov <sergey dot balabanov at gmail dot com>

_pkgauthor=aquaproj
_pkgname=aqua
pkgname=${_pkgname}-bin
pkgver=2.48.3
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

sha256sums_x86_64=('fce8ace1d57fdd78109df43feaa9b0ce28b9ae1e3f2afa2af78e4deca53a7f9a')
sha256sums_aarch64=('2402ba360787677be0132d4f64e2814e4f1d63128f3ddc66ed4a9cb3dc04abea')

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
