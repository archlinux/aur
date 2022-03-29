# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=5.4.1
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('50f64747989dc1fcde5db5cb82f8ac132a174b607ca7dfdb13da2f0e509fda11');;
  aarch64)   _CARCH=arm64 && sha256sums=('712ffb338ec1fed6f7c1c8691b79bc80967cc17fef256cd620190d0d7e502052');;
  arm*)      _CARCH=arm   && sha256sums=('68a3db44493b121e8f48a88ce1976fda78f200a5740ca0fcd7a828cf21a5264a');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
