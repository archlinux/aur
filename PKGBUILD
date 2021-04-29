# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=4.4.3
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('34afe9baa2fd67b0287535f896f5316bf604b009534b84a793dae084c6ca805a');;
  aarch64)   _CARCH=arm64 && sha256sums=('30dd629b1f25fa7b3ef1d8219135d8dbc3e75cf133e0c07573d86e82070dc255');;
  arm*)      _CARCH=arm   && sha256sums=('241018bfd04ae7f84db9b7ff62ebf32468c05f576c6ab1cbef9e1e808f8cbe41');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
