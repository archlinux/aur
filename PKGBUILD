# Maintainer:  Humble Penguin <humblepenguinn@gmail.com>
# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="envio"
pkgname="${_pkgname}-bin"
pkgver=0.8.0
pkgrel=1
pkgdesc="A Modern And Secure CLI Tool For Managing Environment Variables"
arch=(
  'aarch64'
  'i686'
  'x86_64'
)
url="https://github.com/envio-cli/${_pkgname}"
license=(
  'Apache-2.0 OR MIT'
)
depends=(
  'glibc'
  'libgcc'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
source_aarch64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz"
)
source_i686=(
  "${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-i686-unknown-linux-gnu.tar.gz"
)
source_x86_64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
)
sha256sums_aarch64=('f5c68399397da2ef13020e5d419d5fb1c1983ab31bd7d01ddcdbb15cbe7328ab')
sha256sums_i686=('168be693acf148c59df0e60631ae85a9c5cfe989d7eb83a4ce81bfa23baa9ca1')
sha256sums_x86_64=('7896721033b30aeeccf9020bf594241087fb4472779fb75d8268f9866c950509')

package() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}/${source_artifact%.tar*}"
  install -vDm755 "${_pkgname}"    "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"      "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-APACHE"
  install -vDm644 "LICENSE-MIT"    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
  install -vDm644 "${_pkgname}.1"  "${pkgdir}/usr/share/man/man1/${_pkgname}.1"

  cd "autocomplete"
  install -vDm644 "${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -vDm644 "${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -vDm644 "_${_pkgname}.ps1" "${pkgdir}/usr/share/powershell/Completions/${_pkgname}.ps1"
  install -vDm644 "_${_pkgname}"     "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
