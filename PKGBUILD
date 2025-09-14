# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="m8c"
pkgname="${_pkgname}-bin"
pkgver=2.1.0+2025_09_05
_pkgver_tag="${pkgver%+*}"
_pkgver_date="${pkgver##*+}"
pkgrel=1
pkgdesc="A UI for the M8 and M8 Headless portable music DAWs"
arch=('x86_64')
url="https://github.com/laamaa/${_pkgname}"
license=('MIT')
depends=(
  'glibc'
  'libserialport'
  'sdl3'
)
makedepends=(
  'patchelf'
)
provides=(
  "${_pkgname}=${_pkgver_tag}"
)
conflicts=(
  "${_pkgname}=${_pkgver_tag}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.zip::${url}/releases/download/v${_pkgver_tag}/${_pkgname}-${_pkgver_date//_/-}-linux-x86_64.zip")
sha256sums_x86_64=('080c4533b4baefcd2e7720d7017cc6244de28fa5c10143acf4bd1195574ba11f')

prepare() {
  cd "${srcdir}"
  patchelf --remove-rpath "${_pkgname}"
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "AUDIOGUIDE.md" "${pkgdir}/usr/share/doc/${_pkgname}/AUDIOGUIDE.md"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "gamecontrollerdb.txt" "${pkgdir}/usr/share/doc/${_pkgname}/gamecontrollerdb.txt"
}
