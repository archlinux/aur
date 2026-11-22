# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=llm-cost-dashboard-bin
pkgver=1.4.2
pkgrel=1
pkgdesc="Prices every LLM API call from OpenAI, Anthropic and Claude Code logs, with a budget"
arch=('x86_64' 'aarch64')
url="https://github.com/Mattbusel/llm-cost-dashboard"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/llm-cost-dashboard-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/llm-cost-dashboard-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('d40c300558b8dcd0cff0fb6cff3fde57710112cd307ff7f619ede9dbaed55187')
sha256sums_aarch64=('2fa2a89f75d858342dfeac66a6bb46bfa36deab3e4fbb6b7526cd58a48d9ac49')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="llm-cost-dashboard-v${pkgver}-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="llm-cost-dashboard-v${pkgver}-aarch64-unknown-linux-gnu" ;;
  esac
  cd "$_dir"
  install -Dm755 "llm-dash" "${pkgdir}/usr/bin/llm-dash"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
