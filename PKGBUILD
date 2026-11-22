# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=claude-code-rust-bin
pkgver=0.16.3
pkgrel=1
pkgdesc="A native terminal interface for Claude Code that renders inline into the terminal's scrollback"
arch=('x86_64' 'aarch64')
url="https://github.com/srothgan/claude-code-rust"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip' '!debug' '!emptydirs')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/claude-code-rust-${pkgver}-linux-x64-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/claude-code-rust-${pkgver}-linux-arm64-gnu.tar.gz")
sha256sums_x86_64=('4e999f361153b63c5fe6a48dea29d049a1a1939f24b5670c86c6b21dafa466b4')
sha256sums_aarch64=('5c4ddbd83fdf322fb45aa82d8831c8eb9896aa0d8005384483eac3de90f5361e')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="claude-code-rust-${pkgver}-linux-x64-gnu" ;;
    aarch64) _dir="claude-code-rust-${pkgver}-linux-arm64-gnu" ;;
  esac
  cd "$_dir"
  install -d "${pkgdir}/opt/${pkgname}" "${pkgdir}/usr/bin"
  cp -a . "${pkgdir}/opt/${pkgname}/"
  ln -s "/opt/${pkgname}/claude-rs" "${pkgdir}/usr/bin/claude-rs"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
