# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-beta-bin"
pkgver=5.0.0_rc.0
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('db604fe27ccd76047db2f77d3ceae706687a53ec332f5c883932ad1672901e55');;
  aarch64)   _CARCH=arm64 && sha256sums=('d3338a7ee6105b8899bb5b64d6437dd517cbd5a23a9ddc4716830de68df66cad');;
  arm*)      _CARCH=arm   && sha256sums=('3dbdb7a14fe499702687fa2c1f0355567ce3615fa0d6183b2ff91198695b6d86');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v${pkgver/_/-}/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
