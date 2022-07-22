# Maintainer: tarball <bootctl@gmail.com>

pkgname='netbird-bin'
_pkgname="${pkgname%-bin}"
pkgver=0.8.3
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
sha256sums=(
  '128e36e1f814a12886f3122a1809a404be17f81481275b6624e66937941f5269'
  'ae5938e98c84a2dd4324208389b0a6cdf9a24cf3b66d1001a0b137e008da33ec'
  'ae5938e98c84a2dd4324208389b0a6cdf9a24cf3b66d1001a0b137e008da33ec'
)

_base_url="https://github.com/netbirdio/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux"

source_x86_64=("${pkgname}-${pkgver}-amd64.tar.gz::${_base_url}_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-arm64.tar.gz::${_base_url}_arm64.tar.gz")
source_armv6h=("${pkgname}-${pkgver}-armv6.tar.gz::${_base_url}_armv6.tar.gz")

sha256sums_x86_64=('a97ef48c459cba0639eb9d279cf6db47c38e6dbbf32f3190a2e5c935fc8698e1')
sha256sums_aarch64=('1b8c36c608f1991a07d5927a7ef3ef0721007f37ded07d07ecb13d3eba16ff50')
sha256sums_armv6h=('a3203748608451099fe24184e0c5aa306a2c0702ded4cc461fd35bd94de5d1d4')

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
