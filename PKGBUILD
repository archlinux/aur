# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=proxxx-bin
pkgver=0.19.0
pkgrel=1
pkgdesc="TUI and CLI for Proxmox VE and Proxmox Backup Server"
arch=('x86_64' 'aarch64')
url="https://github.com/fabriziosalmi/proxxx"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/proxxx-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/proxxx-${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('0449bd5a29176bfdf74c8bdb43e7e22aba13bd22fc007b6d25e7ec8bf73818ef')
sha256sums_aarch64=('059f8e8b042d906695debd02c93aa04a3a57ec7730cdb2cf3a5965da097b250a')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="proxxx-${pkgver}-x86_64-unknown-linux-musl" ;;
    aarch64) _dir="proxxx-${pkgver}-aarch64-unknown-linux-musl" ;;
  esac
  install -Dm755 "${_dir}/proxxx" "${pkgdir}/usr/bin/proxxx"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
