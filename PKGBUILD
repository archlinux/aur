# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=orca-agent-bin
pkgver=0.5.23
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
sha256sums_x86_64=('d86dba2d94f38f39bcc4e8921792ff77c574d4fee537117701bc14449a207b31')
sha256sums_aarch64=('41abf956173b3b517335c3c1228132dd289ca5c463a960738f7e51f7817d6f47')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="package/vendor/x86_64-unknown-linux-gnu/bin" ;;
    aarch64) _dir="package/vendor/aarch64-unknown-linux-gnu/bin" ;;
  esac
  install -Dm755 "${_dir}/orca" "${pkgdir}/usr/bin/orca-agent"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
