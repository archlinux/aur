# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=5.3.0
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('b609bf296acb0f0fa5c79f2ff4bdd5901b385833cf469ac503468989e64eb01c');;
  aarch64)   _CARCH=arm64 && sha256sums=('efdeb3ebba60155e21099324012338b076591ec3802a5628d16c66622194ac38');;
  arm*)      _CARCH=arm   && sha256sums=('240c1bbd2f7d86653c033d04bb0dd7e1b6f51e1e8e16ead16bafde4106a3ea64');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
