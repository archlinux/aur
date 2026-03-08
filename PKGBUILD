# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="kestrel"
pkgname="${_pkgname}-bin"
pkgver=1.0.3
pkgrel=1
pkgdesc="File encryption done right"
arch=(
  'aarch64'
  'x86_64'
)
url="https://getkestrel.com"
_url="https://github.com/finfet/${_pkgname}"
license=(
  'BSD-3-Clause'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
)
source_aarch64=(
  "${_url}/releases/download/v${pkgver}/${_pkgname}-linux-v${pkgver}-arm64.tar.gz"
)
source_x86_64=(
  "${_url}/releases/download/v${pkgver}/${_pkgname}-linux-v${pkgver}-amd64.tar.gz"
)
sha256sums=('070005204acc0d99c16bf12629fedcd092b610e67d1af325fa836815cd6a4a03')
sha256sums_aarch64=('32838890ef8b8f8a6dfcabd54ea831e046a8ae314ce140be1b963f23a88d0210')
sha256sums_x86_64=('ec902fa8511c00eb5bddebf9cf32e988877e89a2c6304a92a5a6b95cafa647fa')


package() {
  local source_carch="source_${CARCH}[0]"
  local source_arch="${!source_carch}"
  local source_artifact="${source_arch##*/}"

  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"

  cd "${source_artifact%.tar*}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "completion/${_pkgname}.bash-completion" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -vDm644 "man/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
