# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=5.4.6
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('8075d40c74c97d2642f15f535cb48d6d6e82df143f528833a193d87caac6a176');;
  aarch64)   _CARCH=arm64 && sha256sums=('36db97dfb3f5b56c7cd048924d87abfa5f499c62f524e00e2500fe75f88056ae');;
  arm*)      _CARCH=arm   && sha256sums=('a807aecef48f32da81b0c65b7269f3f60dea7734385a05d3577425e8cbd72863');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
