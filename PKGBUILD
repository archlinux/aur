# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=4.0.0
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('011e2aca2dddd9de7080d0ed58a010dad0c64cea15bf1d5f647cfedf50d2a793');;
  aarch64)   _CARCH=arm64 && sha256sums=('810572603f44a020ed4b6b910c6dea5d158120c5fb35ad07c544c8723b16322d');;
  arm*)      _CARCH=arm   && sha256sums=('c33b04669f6e933602eb3a3de08ea80935a6b682237197c0c0980270f37749f7');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
