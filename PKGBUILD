# Maintainer: tarball <bootctl@gmail.com>

pkgname='wiretrustee-bin'
_pkgname="${pkgname%-bin}"
pkgver=0.3.2
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

source_x86_64=("${pkgname}-${pkgver}.tar.gz::${_base_url}_amd64.tar.gz")
sha256sums_x86_64=('3a3ee1994aa361af2569b8d8244dfab10bb5265ef14b87c3ba397d3db60f3447')

source_aarch64=("${pkgname}-${pkgver}.tar.gz::${_base_url}_arm64.tar.gz")
sha256sums_aarch64=('a64fad4479575280e2842f3237e0e1d18a78a3216f80bdd7475543d2f0c3098c')

source_armv6h=("${pkgname}-${pkgver}.tar.gz::${_base_url}_armv6.tar.gz")
sha256sums_armv6h=('892f2784e1f8529ac38937242782a5bc1f67cc6c7af2049bcd8888ac4b04e251')

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
