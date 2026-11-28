# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rabbitmq-dump-queue-bin
pkgver=0.7.3
pkgrel=1
pkgdesc="Dump RabbitMQ queue messages to files without consuming them"
arch=('x86_64' 'aarch64')
url="https://github.com/dubek/rabbitmq-dump-queue"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tgz::${_dl}/rabbitmq-dump-queue-v${pkgver}-linux-amd64.tgz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tgz::${_dl}/rabbitmq-dump-queue-v${pkgver}-linux-arm64.tgz")
sha256sums_x86_64=('f9392a8f0076a398031db0219a95de210974bed5fe05900217ccbaf82ad294fd')
sha256sums_aarch64=('0392e44fe3484d51d5fb54224139c4b80038b4a6e00623d085720eaf917d8c40')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="rabbitmq-dump-queue-v${pkgver}-linux-amd64" ;;
    aarch64) _dir="rabbitmq-dump-queue-v${pkgver}-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/rabbitmq-dump-queue" "${pkgdir}/usr/bin/rabbitmq-dump-queue"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
