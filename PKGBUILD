# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=absorb-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="Quickly read a file without moving your eyes"
arch=('x86_64' 'aarch64')
url="https://github.com/kloki/absorb"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/absorb-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/absorb-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('6b76c579fcd3270589d01dabf9d8356aa274c9f32a65e7b8e84321187a564ce1')
sha256sums_aarch64=('a6c8e52aa7af0433255a723061819abbd93b2a97463cae60688b277c13ffb7b1')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="absorb-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="absorb-aarch64-unknown-linux-gnu" ;;
  esac
  cd "$_dir"
  install -Dm755 "absorb" "${pkgdir}/usr/bin/absorb"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
