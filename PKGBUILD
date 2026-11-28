# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kubebuddy-bin
pkgver=0.0.39
pkgrel=1
pkgdesc="Kubernetes cluster health, security and configuration scanner"
arch=('x86_64' 'aarch64')
url="https://github.com/KubeDeckio/KubeBuddy"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/kubebuddy_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/kubebuddy_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('5a8ef3f4ad72aa1653374eff5bf57ce02b5909d9cf66a4898f12acdcb601a800')
sha256sums_aarch64=('91479ff6528461dbe683e36523cf6a952a71dd69bbf0954c949caee90ab0678d')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="kubebuddy_${pkgver}_linux_amd64" ;;
    aarch64) _dir="kubebuddy_${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/kubebuddy" "${pkgdir}/usr/bin/kubebuddy"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
