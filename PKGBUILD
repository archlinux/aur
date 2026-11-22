# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=agent-console-tui-bin
pkgver=0.3.7
pkgrel=1
pkgdesc="A local dashboard for Codex and Claude Code"
arch=('x86_64' 'aarch64')
url="https://github.com/buhuipao/agent-console"
license=('MIT OR Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/buhuipao/agent-console/v${pkgver}/LICENSE-MIT")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/agent-console-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/agent-console-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('159e4fccea4a5c0615203a34e1425f12c29647e974d3242abe1ec2aff90b8998')
sha256sums_x86_64=('a5156714c8a87002982bc1e1bd04a9fb8b654267bbece40b3b11b02f2a249b13')
sha256sums_aarch64=('529288065f82b37d52e33002f983c1e4a7c859775d775583e7bb94d0a1a03c30')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="agent-console-v${pkgver}-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="agent-console-v${pkgver}-aarch64-unknown-linux-gnu" ;;
  esac
  cd "$_dir"
  install -Dm755 "agent-console" "${pkgdir}/usr/bin/agent-console"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
