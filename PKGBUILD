# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=freesbc-bin
pkgver=0.8.6
pkgrel=1
pkgdesc="SIP and WebRTC edge proxy and session border controller in one binary"
arch=('x86_64' 'aarch64')
url="https://github.com/rasonyang/freesbc"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/freesbc_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/freesbc_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('4947992b220c2fc4d6973ffa6f0b131292f64bde310c36fa4fba1a6585cbfb7d')
sha256sums_aarch64=('49949bb35553e3b44a7c011863ba8f674c36952773778d56145b8b84ffd74d46')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="freesbc_v${pkgver}_linux_amd64" ;;
    aarch64) _dir="freesbc_v${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/freesbc" "${pkgdir}/usr/bin/freesbc"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
