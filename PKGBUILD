# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=wireguard-tui-bin
pkgver=1.10.0
pkgrel=1
pkgdesc="A Linux TUI for managing WireGuard tunnels with live status, configuration editing, QR import"
arch=('x86_64' 'aarch64')
url="https://github.com/JamilleJung/wireguard-tui"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/wireguard-tui-${pkgver}-x86_64-linux.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/wireguard-tui-${pkgver}-aarch64-linux.tar.gz")
sha256sums_x86_64=('b1b08836933f5e7605f6d9d169f8e381c822fd1834d582138511798b8d3cf971')
sha256sums_aarch64=('46b74db206f5e62409af76c157cc0a681554f65b682b3b87b435aa473aafead1')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="wireguard-tui-${pkgver}-x86_64-linux" ;;
    aarch64) _dir="wireguard-tui-${pkgver}-aarch64-linux" ;;
  esac
  cd "$_dir"
  install -Dm755 "wg-tui" "${pkgdir}/usr/bin/wg-tui"
  install -Dm755 "wg-helper" "${pkgdir}/usr/bin/wg-helper"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
