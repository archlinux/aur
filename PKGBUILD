# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=frps-onekey-bin
pkgver=0.72.0
pkgrel=1
pkgdesc="Frp server one-click configuration script"
arch=('x86_64' 'aarch64')
url="https://github.com/mvscode/frps-onekey"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/frp_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/frp_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('daf719b32ca2778770bb92955e231a07414d754378b9af328aa2642862479804')
sha256sums_aarch64=('02180b857480302fd934e9ddbd50fe2f73229f99062f88756abc6de9df5e95cf')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="frp_${pkgver}_linux_amd64" ;;
    aarch64) _dir="frp_${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/frpc" "${pkgdir}/usr/bin/frpc"
  install -Dm755 "${_dir}/frps" "${pkgdir}/usr/bin/frps"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
