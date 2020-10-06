# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=3.1.0
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('afeb99002f664279b8bc53f40f706325c9f5ef3eb5815c5062ec1176e7f3805f');;
  aarch64)   _CARCH=arm64 && sha256sums=('8739918ae75b84419c7646fe6470134a3b37fec78f9ee9afc48457979ea07cbd');;
  arm*)      _CARCH=arm   && sha256sums=('4649c4bf628ff5bb8976bcefec12fd5ae0178e26bcc88ac90167c70df7356034');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
