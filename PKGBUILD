# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=3.2.0
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('d4d2c3285b0b87175216bc6b2b5edbba5b2acbc8fca4277604d538ec9f38fb70');;
  aarch64)   _CARCH=arm64 && sha256sums=('08a92596a08fc21ff9dce19eb189f3dbb3d17c871ad9e0c61d69ca79b41cc110');;
  arm*)      _CARCH=arm   && sha256sums=('8e740b361767f543548989a394904222ba363d87ea431ebb34c176ed07e2cdb3');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
