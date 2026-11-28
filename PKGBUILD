# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tailsocks-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="Route traffic through Tailscale exit nodes using a local SOCKS5 proxy"
arch=('x86_64' 'aarch64')
url="https://github.com/ItalyPaleAle/tailsocks"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/tailsocks-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/tailsocks-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('f4fc03ffa01a44d5116c910a284ebad30e497bb086338e9ca730b7b2cf5a6594')
sha256sums_aarch64=('b89225f96ccce4f6a32b5119bfc93375b6a47a3b96af280a2a8da3b2a36263cb')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="tailsocks-${pkgver}-linux-amd64" ;;
    aarch64) _dir="tailsocks-${pkgver}-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/tailsocks" "${pkgdir}/usr/bin/tailsocks"
  install -Dm644 "${_dir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
