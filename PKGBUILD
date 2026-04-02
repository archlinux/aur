# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="phylum"
pkgname="${_pkgname}-bin"
pkgver=7.5.0
pkgrel=2
pkgdesc="Command line interface for the Phylum API"
arch=(
  'aarch64'
  'x86_64'
)
url="https://phylum.io"
_url="https://github.com/phylum-dev/cli"
license=(
  'MIT'
)
depends=(
  'glibc'
  'libgcc'
  'zlib'
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
  "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE"
)
source_aarch64=(
  "${_pkgsrc}-aarch64-unknown-linux-gnu.zip::${_url}/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.zip"
)
source_x86_64=(
  "${_pkgsrc}-x86_64-unknown-linux-gnu.zip::${_url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.zip"
)
sha256sums=('d733d415524b70b6e2b3016b2d0e279a12dcfc77dc78d6fb7b852a324455d0e8'
            'bf7bed83defddbaf30ff7c1a7d24a803170064ed729aed1e9686095e8f1f5ca7')
sha256sums_aarch64=('e93af53417ed3c770261cf921de1830b6d38419e0f98a7adb70ba21556e364cf')
sha256sums_x86_64=('678a1f4d58f00d07ea7b1c0465e501748db77b23a097ed43326b6744166ae0e8')

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
