# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-beta-bin"
pkgver=5.0.0_dev.3
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('98885ea7de31767afa7d987c8f42d6e296f2739a2917b39399fbbfbda4391c39');;
  aarch64)   _CARCH=arm64 && sha256sums=('4104e236cb75b96ff160baef52acfff6df44dbd161fbd697f94d76e2396211f1');;
  arm*)      _CARCH=arm   && sha256sums=('6e5dcfa31d5e7d6090ce619dc35f0942e991d6eb2c36cdfd3464ab9b4eacacbc');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v${pkgver/_/-}/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
