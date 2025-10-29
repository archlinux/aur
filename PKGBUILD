# Maintainer: Avenge Media <avengemediallc at gmail dot com>
_pkgauthor=AvengeMedia
_repo=danksearch
_binname=dsearch

pkgname=${_binname}-bin
pkgver=0.0.5
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
            'f7bd7fcb94ba359e4890a493a7d3092c67d75e857d0e51de1c45c97e21592d62'
            '9e4f63aff42e7652d09662ff602757e1dc9868d85a35b2c9cf975a1254d69f2c')
sha256sums_x86_64=('f7382be26b6154b125fc609c822628764028e9efff9d2616d6c4899fc2c222f6')
sha256sums_aarch64=('eb0665a23ab62c5b8821fa2a83d62812a011e1f9a983266f14ccfa1e608df58a')

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
