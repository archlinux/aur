# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=5.7.5
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('5d3f22817d9e163ab6ed43572189dd49fe724d7a6948075b570067747eca8d3f');;
  aarch64)   _CARCH=arm64 && sha256sums=('ac12fcf8e35481769e173c96d3fa70dc581826482d927b94a560a3375df2621e');;
  arm*)      _CARCH=arm   && sha256sums=('0ac4ff33dec85939cd1b08b7ae0dac174c0bfa80f499e84a3a67d700c02da9a3');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
