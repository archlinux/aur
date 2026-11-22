# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=savras-bin
pkgver=0.1.11
pkgrel=1
pkgdesc="A side panel that sees every Claude Code session you have running"
arch=('x86_64' 'aarch64')
url="https://github.com/Marijusaj/savras"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/savras-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/savras-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('90e93be66d860c106a12300e39e261e56a506800e7779bf261547c84aa6d74bd')
sha256sums_aarch64=('8cbfea4074978357565bce4961b5aa7dbe9839b069558517b66cae7c022d56c1')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="savras-${pkgver}-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="savras-${pkgver}-aarch64-unknown-linux-gnu" ;;
  esac
  cd "$_dir"
  install -Dm755 "svr" "${pkgdir}/usr/bin/svr"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
