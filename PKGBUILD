# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="diagon"
pkgname="${_pkgname}-bin"
pkgver=1.1.158
pkgrel=2
pkgdesc="Cli text diagram generator"
arch=(
  'x86_64'
)
url="https://github.com/ArthurSonzogni/Diagon"
license=(
  'MIT'
)
depends=(
  'glibc'
  'libgcc'
  'libstdc++'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
)
source_x86_64=(
  # "${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-Linux.tar.gz"
  "${_pkgname}-${pkgver}-Linux.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-1.1.156-Linux.tar.gz"
)
sha256sums=('936a20adf981532c1d0ce3bd0b97db41966a8d1e3bec0c4195d614684cd1323f'
            'a8f8105ef36e4bbdccaf64d588891fdcd971635cf965e45beef84bbb0b4c9d9e')
sha256sums_x86_64=('7b61001d863f60bfb0e2885b293126ae4cd7710f01d5a334b48d7b957f006d00')

package() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "${source_artifact%.tar*}/bin"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
