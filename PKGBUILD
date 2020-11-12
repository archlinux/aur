# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=3.2.1
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('cbc67edac74a645fdf803195277c5ac27a91036d089f67a2af5238a690cb7d57');;
  aarch64)   _CARCH=arm64 && sha256sums=('3e680fead243fad5b82dac5d7154e921535c1d506101db6b2b6d237a2d4b79f1');;
  arm*)      _CARCH=arm   && sha256sums=('491b87ff42cfd33bb78cfe5f4f7728d3a91675cccf6904cffc2ec2bbe3f7069e');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
