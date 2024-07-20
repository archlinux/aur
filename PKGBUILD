# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="scorecard"
pkgname="${_pkgname}-bin"
pkgver=5.0.0
pkgrel=1
pkgdesc="Security health metrics for Open Source"
arch=('x86_64' 'aarch64')
url="${_pkgname}.dev"
_url="https://github.com/ossf/${_pkgname}"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('c2c66209330afe53d2e5457f4834d73cae480ffad76cfedde8186c3862205962')
sha256sums_aarch64=('963bd6161168c6b4a43af523062e19473aa655d3521148bc94a1119e91e5ecf4')

case "${CARCH}" in
  x86_64)
    _arch="amd64"
    ;;
  aarch64)
    _arch="arm64"
    ;;
  *)
    echo "Unsupported architecture: ${CARCH}"
    exit 1
    ;;
esac

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}-linux-${_arch}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
