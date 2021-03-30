# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=4.4.0
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('18b3372c491c91f7df2a0f6fa28d81de2dffdc38185a9a8388fa286bf2a231ff');;
  aarch64)   _CARCH=arm64 && sha256sums=('b82692729c4ecb30213577954d6faf3504e54b13a22a2eec1d8413d9353a2152');;
  arm*)      _CARCH=arm   && sha256sums=('00c9c7396c17a72445d93400ac7aef85604aaec4df625d6809708f67cf7eb883');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
