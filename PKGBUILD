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
  x86_64)    _CARCH=amd64 && sha256sums=('b0f97eb10b0da554a4ed8376837288bd30448a6b4f4d7e2671a953afc63df065');;
  aarch64)   _CARCH=arm64 && sha256sums=('b4eed973336fb219c9874719e878d4cefe07f1ec0c52b296b29614253e512810');;
  arm*)      _CARCH=arm   && sha256sums=('95db302358f63ff471ad7448a8321a81fa91997ed65a06e1b7440d774a0633e8');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v${pkgver/_/-}/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
