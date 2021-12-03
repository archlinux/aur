# Maintainer: tarball <bootctl@gmail.com>

pkgname='wiretrustee-bin'
_pkgname="${pkgname%-bin}"
pkgver=0.3.1
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
sha256sums_x86_64=('250b70cc3fa050c489c2020d6bc52e2f7d98285114c43e1384e7ac5cbd9d362e')

source_aarch64=("${pkgname}-${pkgver}.tar.gz::${_base_url}_arm64.tar.gz")
sha256sums_aarch64=('63c978e4779f6f473b972a5647335846c9fdaad5452250bee7091f9747629841')

source_armv6h=("${pkgname}-${pkgver}.tar.gz::${_base_url}_armv6.tar.gz")
sha256sums_armv6h=('db5e6160ff4d972dbab751cbcdbd1f160f36914cf4dcf100a98ce91c7c213e24')

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
