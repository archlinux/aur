# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=promu-bin
pkgver=0.21.0
pkgrel=1
pkgdesc="Prometheus build and release utility"
arch=('x86_64' 'aarch64')
url="https://github.com/prometheus/promu"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/promu-${pkgver}.linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/promu-${pkgver}.linux-arm64.tar.gz")
sha256sums_x86_64=('f74538222c1a986884d2b31c3a3de0c7e138829a37249806bd89c46897730335')
sha256sums_aarch64=('cf7fd19dbde5b5735215bff18fb3a269b22f2e59e55a60c53915e23a6eb5d77b')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="promu-${pkgver}.linux-amd64" ;;
    aarch64) _dir="promu-${pkgver}.linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/promu" "${pkgdir}/usr/bin/promu"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
