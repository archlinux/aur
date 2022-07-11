# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=5.4.4
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('786151745379e511bd4dd95d1593241bb2b0a1d91e088573a1a1cb104732a3bd');;
  aarch64)   _CARCH=arm64 && sha256sums=('9feb8067e89702947ed17d1e18fd3e445046f4114fbae6f491df8463a72fedfa');;
  arm*)      _CARCH=arm   && sha256sums=('c1468a8db2737bf9a481926a40076de93cac341ede4d4104df78c830ecdc451e');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
