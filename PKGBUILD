# Maintainer: tarball <bootctl@gmail.com>

pkgname='wiretrustee-bin'
_pkgname="${pkgname%-bin}"
pkgver=0.5.1
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
sha256sums_x86_64=('7913e241f852552874e7e93b6fe55afdcdfd9096553b20248dd1e6b220dede0d')

source_aarch64=("${pkgname}-${pkgver}-arm64.tar.gz::${_base_url}_arm64.tar.gz")
sha256sums_aarch64=('2698a0a1b54c4e48e9d1b45f70075872fe15b584d03e59d99f741b56d3409af4')

source_armv6h=("${pkgname}-${pkgver}-armv6.tar.gz::${_base_url}_armv6.tar.gz")
sha256sums_armv6h=('38a57d7f49130acba74d08e5d367c4be5ac6917fe4665b8b973ad0d9a1ba1fd1')

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
