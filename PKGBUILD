# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=nats-surveyor-bin
pkgver=0.9.14
pkgrel=1
pkgdesc="Monitoring for NATS"
arch=('x86_64' 'aarch64')
url="https://github.com/nats-io/nats-surveyor"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/nats-surveyor-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/nats-surveyor-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('c69194745e531e984b8bcb36539b3f4b089c4269658e46a93c271494255d61a1')
sha256sums_aarch64=('400dfbb47a13780d84b8ab749cc890bc1b5b659a7b094b0bf9b6431267509695')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="nats-surveyor-v${pkgver}-linux-amd64" ;;
    aarch64) _dir="nats-surveyor-v${pkgver}-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/nats-surveyor" "${pkgdir}/usr/bin/nats-surveyor"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
