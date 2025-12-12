# Maintainer: Avenge Media <avengemediallc at gmail dot com>
_pkgauthor=AvengeMedia
_repo=danksearch
_binname=dsearch

pkgname=${_binname}-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Fast filesystem search service"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_repo}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_repo}/v${pkgver}"
license=('MIT')
provides=("${_binname}")
conflicts=("${_binname}")

source=(
  "LICENSE-${pkgver}::${_urlraw}/LICENSE"
  "README-${pkgver}.md::${_urlraw}/README.md"
  "dsearch.service"  # local file next to PKGBUILD (same as -git)
)
source_x86_64=("${_binname}-${arch[0]}-${pkgver}.gz::${url}/releases/download/v${pkgver}/${_binname}-linux-${_barch[0]}.gz")
source_aarch64=("${_binname}-${arch[1]}-${pkgver}.gz::${url}/releases/download/v${pkgver}/${_binname}-linux-${_barch[1]}.gz")

sha256sums=('4cee96286c5b7da9763a4694868bb1853b33bb1558821e0c609ad2eabd426bfa'
            '6a4cb2d57168eff67f565dc45b71cf118b6c02f69c3fa35184fd670196c54306'
            '6908e1e996cf4c457543dbf108e70c9dda7b03229dd11badd3a28598373e5b4b')
sha256sums_x86_64=('3041725145f907caa5ae52ee2d23c62b67da922d53420c06bcad988735115b7a')
sha256sums_aarch64=('85ed045e154840ef4d16b11ddebd92dcb119b17872bb371df7df3cc36019460d')

package() {
  cd "${srcdir}" || exit 1

  # makepkg auto-ungzips the aliased sources to "${_binname}-${CARCH}-${pkgver}"
  install -Dm755 "${_binname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_binname}"

  # systemd user unit (same path as your -git package)
  install -Dm644 "dsearch.service" "${pkgdir}/usr/lib/systemd/user/dsearch.service"

  # docs
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
