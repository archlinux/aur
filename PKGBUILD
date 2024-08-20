# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=5.7.3
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('0fe23b8c0a151e9c41d16f9d861be26df65e5ab7f35115424220aad5a83c566b');;
  aarch64)   _CARCH=arm64 && sha256sums=('5773151a37af65c41eb901297df37b47bb73a7804a1794dcb0527bc39fc2e9df');;
  arm*)      _CARCH=arm   && sha256sums=('cbca05ebc23ad840e8fce22db628b092311161ff6f5eeae37a25b72ff4eb4444');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
