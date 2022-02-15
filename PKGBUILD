# Maintainer: tarball <bootctl@gmail.com>

pkgname='wiretrustee-bin'
_pkgname="${pkgname%-bin}"
pkgver=0.3.4
pkgrel=1
pkgdesc='Connect your devices into a single secure private WireGuard®-based mesh network'
url='https://wiretrustee.com'
arch=(x86_64 aarch64 armv6h)
license=('BSD')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=()
makedepends=()
optdepends=()

source=(
  'environment'
  'wiretrustee@.service'
)
sha256sums=(
  '185d92f240e92c8d58dde91bb45d73d09ea22fc48090f30330596f12e6d265e7'
  '672235231a73743878d77e94827c5aba326464dae63457f94cd51708ac84ba58'
)

_base_url="https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux"

source_x86_64=("${pkgname}-${pkgver}-amd64.tar.gz::${_base_url}_amd64.tar.gz")
sha256sums_x86_64=('a7d0cf177ee9d6d5f49d50bc16fc86e49d9df2901888e62b1fa48edb67fd02ea')

source_aarch64=("${pkgname}-${pkgver}-arm64.tar.gz::${_base_url}_arm64.tar.gz")
sha256sums_aarch64=('82159723835cd05172e8acb19387a44eed28e98680a60cfd3cd0e1ac53e5b302')

source_armv6h=("${pkgname}-${pkgver}-armv6.tar.gz::${_base_url}_armv6.tar.gz")
sha256sums_armv6h=('9f8723f4bd37129ce05ceaf09eedafb96519d716e3b1e81d8620315d18d25129')

package() {
  # binary
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  # config directory
  install -Ddm755 -o root -g root "${pkgdir}/etc/${_pkgname}"

  # environment file
  install -Dm644 environment "${pkgdir}/etc/default/${_pkgname}"

  # systemd unit
  install -Dm644 "${_pkgname}@.service" \
    "${pkgdir}/usr/lib/systemd/system/${_pkgname}@.service"

  # license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
