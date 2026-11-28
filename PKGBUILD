# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gcsproxy-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Reverse proxy for Google Cloud Storage"
arch=('x86_64' 'aarch64')
url="https://github.com/daichirata/gcsproxy"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/gcsproxy-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/gcsproxy-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('225934a44865f49c0f3ca783d27957795001af6438adda2cc795a0091025ea2d')
sha256sums_aarch64=('195b05ef350c453662e341243abd4c8510da177974221f1276c6a7a5ac43c396')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="gcsproxy-${pkgver}-linux-amd64" ;;
    aarch64) _dir="gcsproxy-${pkgver}-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/gcsproxy" "${pkgdir}/usr/bin/gcsproxy"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
