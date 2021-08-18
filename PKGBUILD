# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-beta-bin"
pkgver=4.4.8_rc.1
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('2213423270ead761a9aa25c68a82a241b4f4cfb75f552b3255dbf5ed205f54d0');;
  aarch64)   _CARCH=arm64 && sha256sums=('be45f9f55e2823e30abd5966b4602ff3c97c3c9530cd595fa4f77389126afe09');;
  arm*)      _CARCH=arm   && sha256sums=('bb0c5e2c715ab10b8d09c2394108cafdbe3525289d6d6833f769878e3216c97a');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v${pkgver/_/-}/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
