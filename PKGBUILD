# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=4.1.0
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('108edf8bc3a6d4498620b56cdc46137e4426e6349fd64b47e922a94da3186536');;
  aarch64)   _CARCH=arm64 && sha256sums=('fa2604301057115992e9a12abf4080a42067d466a935fdf9e768c7f1a7f16d22');;
  arm*)      _CARCH=arm   && sha256sums=('b3cb3859745fadf059558ce69d37a832a5545cf9e6703cead3857c0ffad8808f');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
