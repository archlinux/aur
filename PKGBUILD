# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kanzo-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="Self-hosted, shareable kanban board for humans and AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/emanuele-em/kanzo"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/kanzo-x86_64-unknown-linux-musl.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/kanzo-aarch64-unknown-linux-musl.tar.xz")
sha256sums_x86_64=('146c24e93c943158fae8fe35f070f49414a1f4754832312361dba895d3cbefea')
sha256sums_aarch64=('80eda8efc44b4a393d210cc10cd2feb2608e32098b3ee9425d50fe60b7a97a43')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="kanzo-x86_64-unknown-linux-musl" ;;
    aarch64) _dir="kanzo-aarch64-unknown-linux-musl" ;;
  esac
  install -Dm755 "${_dir}/kanzo" "${pkgdir}/usr/bin/kanzo"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
