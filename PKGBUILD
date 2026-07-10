# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=tile38-bin
_pkgname="${pkgname%-bin}"
pkgver=1.38.0
pkgrel=1
pkgdesc='An in-memory geolocation data store, spatial index, and realtime geofencing server'
arch=(x86_64 aarch64 armv7h)
url='https://tile38.com'
license=('MIT')
depends=(ca-certificates)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!debug)
source_x86_64=("${_pkgname}-x86_64-${pkgver}::https://github.com/tidwall/tile38/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${_pkgname}-aarch64-${pkgver}::https://github.com/tidwall/tile38/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux-arm64.tar.gz")
source_armv7h=("${_pkgname}-armv7h-${pkgver}::https://github.com/tidwall/tile38/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux-arm.tar.gz")
sha256sums_x86_64=('1cbca2c7c11adc045908e8b47f33731e268b08eb9a1b5af829d438743f1fad40')
sha256sums_aarch64=('ccc76b04aad6fce3b121936b7c4f767724ee95ae6cfd70e6e0541cc65a391cdc')
sha256sums_armv7h=('d412b1e69185cc6a388543eff7ea2fa63095248e47a21a7538280182ae0d94ec')

package() {
  local dir
  case $CARCH in
    x86_64) dir="${_pkgname}-${pkgver}-linux-amd64" ;;
    aarch64) dir="${_pkgname}-${pkgver}-linux-arm64" ;;
    armv7h) dir="${_pkgname}-${pkgver}-linux-arm" ;;
  esac
  cd "${dir}"

  install -Dm755 "${_pkgname}"-cli "${pkgdir}/usr/bin/${_pkgname}-cli"
  install -Dm755 "${_pkgname}"-server "${pkgdir}/usr/bin/${_pkgname}-server"
  install -Dm755 "${_pkgname}"-benchmark "${pkgdir}/usr/bin/${_pkgname}-benchmark"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
