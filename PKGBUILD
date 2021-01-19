# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-beta-bin"
pkgver=4.0.0_rc.2
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('4931f9f40c7f1d87d9e0422a4cea736eca87581584697ac2c862c08fa5863c40');;
  aarch64)   _CARCH=arm64 && sha256sums=('7a453f0ae2b713cbc8c5d77c247574d85e775cbd8973193af17bdc80fab47bee');;
  arm*)      _CARCH=arm   && sha256sums=('089c1a61f86b4a2dcc16519931c8a2ef42369cc5565b48732249016ab487dd8b');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v${pkgver/_/-}/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
