# Maintainer: tarball <bootctl@gmail.com>

pkgname='netbird-bin'
_pkgname="${pkgname%-bin}"
pkgver=0.10.2
pkgrel=1
pkgdesc='A WireGuard-based mesh network that connects your devices into a single private network'
url='https://netbird.io'
arch=(x86_64 aarch64 armv6h)
license=('BSD')

provides=("${_pkgname}" wiretrustee)
conflicts=("${_pkgname}")
depends=()
makedepends=()
optdepends=()
replaces=('wiretrustee-bin')

source=(
  'environment'
  'netbird@.service'
  'wiretrustee@.service'
)
sha256sums=('128e36e1f814a12886f3122a1809a404be17f81481275b6624e66937941f5269'
            'ae5938e98c84a2dd4324208389b0a6cdf9a24cf3b66d1001a0b137e008da33ec'
            'ae5938e98c84a2dd4324208389b0a6cdf9a24cf3b66d1001a0b137e008da33ec')
sha256sums_x86_64=('2357d3e59dcd53efeb3a2e1a8c96e96d44a5b833c6dbff9f854e0ae7c1e06e76')
sha256sums_aarch64=('abe0e8f093b96739ecb29f2d442a1ecb2dde2c0f34975eeb4b321e258453b21e')
sha256sums_armv6h=('5b4d7754021b889dadaa4efddb3298c2c43c0fc8e2f09a1f6e868994bd7d4b10')

_base_url="https://github.com/netbirdio/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux"

source_x86_64=("${pkgname}-${pkgver}-amd64.tar.gz::${_base_url}_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-arm64.tar.gz::${_base_url}_arm64.tar.gz")
source_armv6h=("${pkgname}-${pkgver}-armv6.tar.gz::${_base_url}_armv6.tar.gz")

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

  install -Dm644 "wiretrustee@.service" \
    "$pkgdir/usr/lib/systemd/system/wiretrustee@.service"

  # license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
