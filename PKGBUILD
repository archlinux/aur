# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=orca-agent-bin
pkgver=0.5.26
pkgrel=1
pkgdesc="Terminal coding agent for DeepSeek"
arch=('x86_64' 'aarch64')
url="https://github.com/echovic/orca-agent"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/echovic/orca-agent/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tgz::${_dl}/blade-ai-orca-${pkgver}-linux-x64.tgz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tgz::${_dl}/blade-ai-orca-${pkgver}-linux-arm64.tgz")
sha256sums=('ca3956b24fe4d01f280e49f616774a467372007a090ebe9f56b1df7dbfb1de86')
sha256sums_x86_64=('1b335917f3dbef8fd410b231ac5b9b3177b10c6ccf8f4d3fa7bdd413c50187ee')
sha256sums_aarch64=('28669db45ebe756321e279e2032b4332e1c7aaeb8796c17e787ae88cb6ea5c1b')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="package/vendor/x86_64-unknown-linux-gnu/bin" ;;
    aarch64) _dir="package/vendor/aarch64-unknown-linux-gnu/bin" ;;
  esac
  install -Dm755 "${_dir}/orca" "${pkgdir}/usr/bin/orca-agent"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
