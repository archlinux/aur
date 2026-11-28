# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=nats-kafka-bin
pkgver=1.4.2
pkgrel=1
pkgdesc="Bridge between NATS and Kafka"
arch=('x86_64' 'aarch64')
url="https://github.com/nats-io/nats-kafka"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/nats-kafka-v${pkgver}-linux-amd64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/nats-kafka-v${pkgver}-linux-arm64.zip")
sha256sums_x86_64=('dc984963983e4d4b0a7f3e0d7b9a5de3c508c7e45033790b94712ac2e2f28d5f')
sha256sums_aarch64=('0ab48d4b3a18cd53299eccc6838c33e376653e373740e2cb1ba34ef1508d0e83')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="nats-kafka-v${pkgver}-linux-amd64" ;;
    aarch64) _dir="nats-kafka-v${pkgver}-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/nats-kafka" "${pkgdir}/usr/bin/nats-kafka"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
