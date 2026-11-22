# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tapin-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="An inbox for your AI coding agents (Claude Code, Codex): approve requests, answer questions"
arch=('x86_64' 'aarch64')
url="https://github.com/Thevi99/tapin"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/tapin-x86_64-unknown-linux-musl.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/tapin-aarch64-unknown-linux-musl.tar.xz")
sha256sums_x86_64=('da2967531365360949fa33285438d148d2e3d62647cf980515fb1b1da8c83d86')
sha256sums_aarch64=('9edc8152df940786c50c1a4841c958bc3fdb84139637ff4173626a0a8c678415')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="tapin-x86_64-unknown-linux-musl" ;;
    aarch64) _dir="tapin-aarch64-unknown-linux-musl" ;;
  esac
  cd "$_dir"
  install -Dm755 "tapin" "${pkgdir}/usr/bin/tapin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
