# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=4.2.0
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('745396701fb0ffaa832b02c5b734fd5b6bb042ac878b3ad16bb810ebbf02df0c');;
  aarch64)   _CARCH=arm64 && sha256sums=('5077b74f9d6274eb4afeb7abbd8d4ae12496b33d9faf723d50c36e0c78b993cb');;
  arm*)      _CARCH=arm   && sha256sums=('21a69922a2778acb00a62868fae2dc5d3ce252fa5b576d54e811eda7d3a4a1f5');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
