# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=5.4.9
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('5fd6597668e7b09c126eddbafa79f8e0c33695f2974e35f8c9463ef3462f3113');;
  aarch64)   _CARCH=arm64 && sha256sums=('7d4d9272ee7fa294ecd817e32566fccf514489d5d9556f0cc471decf5ecefa15');;
  arm*)      _CARCH=arm   && sha256sums=('57c58567ab3aa05ff3e25648846c44452d0e7aee507cbbb610503ef92eb40673');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
