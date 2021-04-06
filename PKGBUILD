# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=4.4.1
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('446891db12792edcc2c6bbf8c90d59e0f549eb57dbc070b0a326ae0f1cf455ae');;
  aarch64)   _CARCH=arm64 && sha256sums=('b2f4cffcb2519f821126910711cf922f78bccc611f7821feb6807f891b159c58');;
  arm*)      _CARCH=arm   && sha256sums=('43fe1493d94f55a47b6a7f830fa91d1ffc0b6383199b7974135d8b735ac331e9');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
