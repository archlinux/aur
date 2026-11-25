# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=codex-manager-bin
pkgver=0.7.5
pkgrel=1
pkgdesc="Codex cli Codex cli"
arch=('x86_64' 'aarch64')
url="https://github.com/qxcnm/Codex-Manager"
license=('MIT')
depends=('glibc' 'libgcc' 'openssl-3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/qxcnm/Codex-Manager/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/CodexManager-web-linux-x86_64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/CodexManager-web-linux-arm64.zip")
sha256sums=('b3cd584756c0b14c97fd0aa66b1e28225788d122508707c68bca73b183d3733d')
sha256sums_x86_64=('675d95db18882dd676f25ecad73341764c9c6111fc3ec730cf03dcfb81673396')
sha256sums_aarch64=('aac70d9e50be938381926b573d8c89eb5ef3578d3b476eae5abd7b219262b00c')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="CodexManager-service-linux-x86_64" ;;
    aarch64) _dir="CodexManager-service-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/codexmanager-start" "${pkgdir}/usr/bin/codexmanager-start"
  install -Dm755 "${_dir}/codexmanager-service" "${pkgdir}/usr/bin/codexmanager-service"
  install -Dm755 "${_dir}/codexmanager-web" "${pkgdir}/usr/bin/codexmanager-web"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
