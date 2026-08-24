# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="safecloset"
pkgname="${_pkgname}-bin"
pkgver=1.5.0
pkgrel=1
pkgdesc="Cross-platform Secure TUI Secret Locker"
arch=(
  'x86_64'
)
url="https://dystroy.org/safecloset/"
_url="https://github.com/Canop/${_pkgname}"
license=(
  'AGPL-3.0-only'
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
_pkgsrc="${_url##*/}-${pkgver}"
source=(
  "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE"
)
source_x86_64=(
  "${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}.zip"
)
sha256sums=('8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef')
sha256sums_x86_64=('285eaa835397f8567304d6230a45129ea480acccb246ee04d878ff1a9d00c997')

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "build"
  install -vDm644 "CHANGELOG.md" "README.md" -t "${pkgdir}/usr/share/doc/${_pkgname}"

  cd "${CHOST/-pc-/-unknown-}"
  install -vDm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
