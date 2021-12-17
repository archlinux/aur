# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=5.2.2
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('7ddb900e6e50120b65d61568f6af007a82331bf83918608a6a7be8910792faef');;
  aarch64)   _CARCH=arm64 && sha256sums=('ccf1dafc1eddfef083375377a52ef0ca269a41c5bc4f0f4d7e11a7c56da08833');;
  arm*)      _CARCH=arm   && sha256sums=('e3e0c87d419c77295112ff7ccbc8d6228c8738f01b6ec458d76dceeff7710c5c');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
