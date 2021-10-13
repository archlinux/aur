# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=5.0.1
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('84a45821b16df2fb60ab9144bad3d0e67805a2bfee17bee51b09bc1e75c0fc10');;
  aarch64)   _CARCH=arm64 && sha256sums=('e52cadf623e8a73e64f0715c29d8a6719b81d64a05ea78d577626b666239c15a');;
  arm*)      _CARCH=arm   && sha256sums=('5cec62ee8584ffb4e21167dc6dbb01bd36c0d2cd96e544662fd882aaa5e9d3ab');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
