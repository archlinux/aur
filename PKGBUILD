# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=orca-agent-bin
pkgver=0.5.25
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
sha256sums_x86_64=('b00e0689196070047ed09ae6a5429f0ffbf52f38bc5b86d68e8bb887844bc9b5')
sha256sums_aarch64=('197967cdc81678987009b8268b655caf3e783a37254a16d006618d1252cb8676')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="package/vendor/x86_64-unknown-linux-gnu/bin" ;;
    aarch64) _dir="package/vendor/aarch64-unknown-linux-gnu/bin" ;;
  esac
  install -Dm755 "${_dir}/orca" "${pkgdir}/usr/bin/orca-agent"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
