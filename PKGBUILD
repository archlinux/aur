# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pantalk-bin
pkgver=0.0.12
pkgrel=1
pkgdesc="Give your AI agent a voice on every chat platform"
arch=('x86_64' 'aarch64')
url="https://github.com/pantalk/pantalk"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/pantalk/pantalk/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/pantalk-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/pantalk-linux-arm64.tar.gz")
sha256sums=('7941ef3ef35ed996097edc76dbe8fc716cfa6c0ea1b1f85227d201c3dcbb6213')
sha256sums_x86_64=('9fb2c355a2955e67362a863c2bc1acaab71b9ec8f08296e5267d53802caf473a')
sha256sums_aarch64=('2873a81b857baa7f99bc2df28a415929c8e451e64aa41675915772475ee2af5e')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="pantalk-v${pkgver}-linux-amd64" ;;
    aarch64) _dir="pantalk-v${pkgver}-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/pantalk" "${pkgdir}/usr/bin/pantalk"
  install -Dm755 "${_dir}/pantalkd" "${pkgdir}/usr/bin/pantalkd"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
