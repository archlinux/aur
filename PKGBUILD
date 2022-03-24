# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-beta-bin"
pkgver=5.4.0_dev.2
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('4f10f5ded204dcfe849d131555e40dab340f62c1b0b4159f82d756e5dab2b8e1');;
  aarch64)   _CARCH=arm64 && sha256sums=('e52f01614f1ad61befc794c5349d743fce3dfb0d7fa531db8389692d2e26121b');;
  arm*)      _CARCH=arm   && sha256sums=('2b5518c7e9cf7de7e3614cf0ae4006271066e38eed420357c90902a5cf7d0898');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v${pkgver/_/-}/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
