# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-beta-bin"
pkgver=5.0.1_rc.0
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('d3b7ba6d9f717650187df6794599e43b1900193c54e27f7d884735a684a249e6');;
  aarch64)   _CARCH=arm64 && sha256sums=('99a83819c1065f6413c55367667edaa90fc23d673a0f5c04ec128479ed0821df');;
  arm*)      _CARCH=arm   && sha256sums=('0add4e9713c9eb194ad5d1773d79e81fc83f56bd98651333b79d410f811e6455');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v${pkgver/_/-}/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
