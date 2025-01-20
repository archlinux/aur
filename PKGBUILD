# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=5.8.1
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('b900911e5943fecbc341f21a628d9c425d19b629bad8df13d60ba28d1f8e2e6e');;
  aarch64)   _CARCH=arm64 && sha256sums=('a0b73a2ca6a85688e53eb17b5d7dc5bab97280317668d81e6511b1b73e33a79d');;
  arm*)      _CARCH=arm   && sha256sums=('90074c38e9fe2f7bc39318a05e88d88de6f56a094ce3e13f0ec4513ba92a64ea');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
