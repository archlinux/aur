# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-beta-bin"
pkgver=5.0.0_rc.4
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('e58ca1d35203ecfca3ef71c4c5087e933c31cb5b928713fbeff820324128b86c');;
  aarch64)   _CARCH=arm64 && sha256sums=('926669cdea4585e37a46d8eb024de9df91875c829b41e71e2ab9a7ce4373615f');;
  arm*)      _CARCH=arm   && sha256sums=('991a1ddc50bc1c9ff86c38f4bfe83ad08bba9ec82034575f3b14b15c24787f51');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v${pkgver/_/-}/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
