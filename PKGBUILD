# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gitty-tui-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="A terminal Git client with the GitHub Desktop experience: history, line staging, fetch, pull"
arch=('x86_64' 'aarch64')
url="https://github.com/VedangP57/gitty"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/gitty-cli-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/gitty-cli-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('9e2bc4a0b262e25f0d735a1394902783ca21b1f6938993182d154944d79cb8f0')
sha256sums_aarch64=('414635ded833ef145e57c5e89fa97d6efabfc41f3a5abb7ba1239490bbf198fd')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="gitty-cli-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="gitty-cli-aarch64-unknown-linux-gnu" ;;
  esac
  cd "$_dir"
  install -Dm755 "gitty" "${pkgdir}/usr/bin/gitty"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
