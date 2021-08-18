# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-beta-bin"
pkgver=4.4.8_rc.2
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('20e55cc1ae5800d6343bdd03678ecba9bf9e63ba6ba499766b1c0aff62572840');;
  aarch64)   _CARCH=arm64 && sha256sums=('f5dd5856b046de743429a0e6066e0241d82ec2cf6b9e5cffc8ef4ac01024b88d');;
  arm*)      _CARCH=arm   && sha256sums=('eb2bdfdc8a5bcd601d3ea758224a4d8b0dc7cbe2684b19b52c732cc7ee0ac309');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v${pkgver/_/-}/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
