# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=5.7.2
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('3c5aaf09bea85bb9b756e83eedc9b3db37a0e4e9d844952cd2a986d39c0f1d4b');;
  aarch64)   _CARCH=arm64 && sha256sums=('07cb12a554d9ff5eb6fcf7d54b625e1bd5f9d88886a83d8d1ffadb305db9f42f');;
  arm*)      _CARCH=arm   && sha256sums=('d2accb1b873bf0f9bad157c8d87e2f7c4710ee192a31b87f537c8b715fc6aca6');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
