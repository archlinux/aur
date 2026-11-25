# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=spytify-bin
pkgver=2.0.2
pkgrel=1
pkgdesc="Records an application's audio, splits it into tracks and tags them"
arch=('x86_64' 'aarch64')
url="https://github.com/spytify/spytify"
license=('MIT')
depends=('glibc' 'libglvnd' 'wayland')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/spytify-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/spytify-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('d9bb1b01e18e90d16e07394aac3e4a3f6406c57831aa9799514c171a48f3a5f7')
sha256sums_aarch64=('28493f6d50916bfcf885a25137f0202aed06c8b979a130dbd5eed88725d22492')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="spytify-${pkgver}-linux-amd64" ;;
    aarch64) _dir="spytify-${pkgver}-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/spytify-ui" "${pkgdir}/usr/bin/spytify-ui"
  install -Dm755 "${_dir}/spytifyd" "${pkgdir}/usr/bin/spytifyd"
  install -Dm755 "${_dir}/spytify-cli" "${pkgdir}/usr/bin/spytify-cli"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
