# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-beta-bin"
pkgver=4.0.0_alpha.1
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('8179aed004c63bb290d3948bf9e3c53ac6e5da04d849edabad550f92e404bc60');;
  aarch64)   _CARCH=arm64 && sha256sums=('277f99e88be2c59038a6790bb6d2a14b152edf6b0a486ca009405d634fe2ae91');;
  arm*)      _CARCH=arm   && sha256sums=('74d851bec69d9227ec96f042198cc1436b986ecb28cf84c04e4bb3e1645bf4d7');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v${pkgver/_/-}/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
