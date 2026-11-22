# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sued-rs-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="A horror-themed recreation of SueD, the 2000s Brazilian prank oracle"
arch=('x86_64' 'aarch64')
url="https://github.com/Danilo-Guedes/sued-rs"
license=('MIT OR Apache-2.0')
depends=('alsa-lib' 'glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/sued-rs-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/sued-rs-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('e9be3561a6b73d6b9f2914b8dff7cd9c7f029f9ee61c1e95ee6dbc76daa31a00')
sha256sums_aarch64=('28902c7148cfc078d8864a8d27e33838ca5aca3c52687ebe279b4898711c02ef')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="sued-rs-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="sued-rs-aarch64-unknown-linux-gnu" ;;
  esac
  cd "$_dir"
  install -Dm755 "sued-rs" "${pkgdir}/usr/bin/sued-rs"
  install -Dm644 "LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
