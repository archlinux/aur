# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cc-pane-bin
pkgver=0.13.2
pkgrel=1
pkgdesc="Web version of CC-Panes, a multi-instance split-pane manager for Claude Code"
arch=('x86_64' 'aarch64')
url="https://github.com/wuxiran/cc-pane"
license=('MIT')
depends=('glibc' 'libgcc' 'openssl-3' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/wuxiran/cc-pane/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/cc-panes-web_${pkgver}_linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/cc-panes-web_${pkgver}_linux-aarch64.tar.gz")
sha256sums=('4e2b851b4f15c6ae5e92074b5019d25a4df77458dec9eed43747c052fc4bd385')
sha256sums_x86_64=('b3b46605d77ddaf8736b4715c748e1e799f8492d5ef11ab02903ee673b0101ad')
sha256sums_aarch64=('25a30cff429e6656031153536116ed8d7a7997e539f8b6a0fd847d95ca613d9b')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="cc-panes-web_${pkgver}_linux-x86_64" ;;
    aarch64) _dir="cc-panes-web_${pkgver}_linux-aarch64" ;;
  esac
  install -Dm755 "${_dir}/cc-panes-web" "${pkgdir}/usr/bin/cc-panes-web"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
