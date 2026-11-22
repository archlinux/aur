# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=hostkeep-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="A TUI for editing /etc/hosts: toggle entries, organize them into groups, save with a diff preview"
arch=('x86_64' 'aarch64')
url="https://github.com/volodymyr-malishevskyi/hostkeep"
license=('MIT OR Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/hostkeep-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/hostkeep-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('a0923d11809f2b5c78047afd13c3c76920a94bff82d922f81a5423b77f227a6e')
sha256sums_aarch64=('1c3877bfb3e26d5f7fdf85f41b8bff68fc164b73faa1f8c4de1dca8970be6947')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="hostkeep-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="hostkeep-aarch64-unknown-linux-gnu" ;;
  esac
  cd "$_dir"
  install -Dm755 "hostkeep" "${pkgdir}/usr/bin/hostkeep"
  install -Dm644 "LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
