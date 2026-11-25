# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pushprox-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Proxy that lets Prometheus scrape targets behind NAT"
arch=('x86_64' 'aarch64')
url="https://github.com/prometheus-community/PushProx"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/PushProx-${pkgver}.linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/PushProx-${pkgver}.linux-arm64.tar.gz")
sha256sums_x86_64=('c75cc05d078d59571b8bda656039584dc4b7be95fc8ab5332bfabb02c2c806a3')
sha256sums_aarch64=('ff20481791e8e6ec78c6fa9011962d7050c822efce357cddbb14ae3004974219')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="PushProx-${pkgver}.linux-amd64" ;;
    aarch64) _dir="PushProx-${pkgver}.linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/pushprox-proxy" "${pkgdir}/usr/bin/pushprox-proxy"
  install -Dm755 "${_dir}/pushprox-client" "${pkgdir}/usr/bin/pushprox-client"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
