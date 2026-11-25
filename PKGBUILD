# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=llm-space-bin
pkgver=4.20.0
pkgrel=1
pkgdesc="A desktop app to prototype agent ideas, inspect every harness step, replay failures, and evaluate performance, all in one place"
arch=('x86_64' 'aarch64')
url="https://github.com/deer-flow/llm-space"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/deer-flow/llm-space/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/llm-space-server-${pkgver}-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/llm-space-server-${pkgver}-linux-arm64.tar.gz")
sha256sums=('bb34a9132f43de68c94353588a48415f50f723316bb56a1bb13041b721788d3e')
sha256sums_x86_64=('de536ee82b5542c1e47cb8561335642f156e7756f1ca9bce4b41fc9c2924f075')
sha256sums_aarch64=('6ce7c52d43ed5534857173f8fe71a59f8cdb6c3436d091a2ca844dd17888921c')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="llm-space-server-${pkgver}-linux-x64/bin" ;;
    aarch64) _dir="llm-space-server-${pkgver}-linux-arm64/bin" ;;
  esac
  install -Dm755 "${_dir}/llm-space-server" "${pkgdir}/usr/bin/llm-space-server"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
