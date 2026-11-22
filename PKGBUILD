# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=claudash-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="The control room for Claude Code"
arch=('x86_64' 'aarch64')
url="https://github.com/jguajardo/claudash"
license=('MIT OR Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/claudash-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/claudash-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('152839207f01e200404f63ac5351a6c10e5af29c07e68eaaadeb5ebbdb9194dc')
sha256sums_aarch64=('801644062d0af3f45cd4c3ece36dec2ef04d44f91e757420cbc36514b96bd01b')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="claudash-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="claudash-aarch64-unknown-linux-gnu" ;;
  esac
  cd "$_dir"
  install -Dm755 "claudash" "${pkgdir}/usr/bin/claudash"
  install -Dm644 "LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
