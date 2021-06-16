# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=4.4.6
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('4e45de05370dbe37d9704bf31735b2fe04c77b4f7a1a965265592b583367ba7f');;
  aarch64)   _CARCH=arm64 && sha256sums=('567e18a59408f9f9fe2b2dd0b727955e3abe96ba2742f08695f702f2692a7605');;
  arm*)      _CARCH=arm   && sha256sums=('4eb47f56924c119ee7581a74d516d32db494dcfc440e0724c45248968256c938');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
