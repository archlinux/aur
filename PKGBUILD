# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=caddyui-bin
pkgver=2.68.22
pkgrel=1
pkgdesc="Self-hosted web UI for managing Caddy proxy hosts, redirects and certificates"
arch=('x86_64' 'aarch64')
url="https://github.com/X4Applegate/caddyui"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/caddyui_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/caddyui_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('6b8801e76ce55478398b5b37536b181c67b8eaa34f0081ab17aaa1f0c05eed7e')
sha256sums_aarch64=('10911b5000fcef9bcd8c2d8fd4eb3fc4b5f28581f9368139bb9414738f0aee43')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="caddyui_v${pkgver}_linux_amd64" ;;
    aarch64) _dir="caddyui_v${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/caddyui" "${pkgdir}/usr/bin/caddyui"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
