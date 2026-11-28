# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ntoseye-bin
pkgver=0.53.0
pkgrel=1
pkgdesc="WinDbg-like Windows kernel debugger for Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/dmaivel/ntoseye"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/ntoseye-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/ntoseye-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('9d157a0da8c8bdc9ed0d5e572de98bdab9c1d3839bd5bb950bd08e50d6f28aef')
sha256sums_aarch64=('0424bf12d20d621b934454a7185f2412cfd0ec74b9909190089e21a57cf4821c')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="ntoseye-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="ntoseye-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/ntoseye" "${pkgdir}/usr/bin/ntoseye"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
