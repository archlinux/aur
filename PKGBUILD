# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=3.4.0
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('1c961f1161d7b7fb55658ee32081b250a0da6d5f81e40c307a0300e3e130d19f');;
  aarch64)   _CARCH=arm64 && sha256sums=('f70ad81b500d1ad5a0cd84c414db32153c40b5ede847a8a118030dd500a1f628');;
  arm*)      _CARCH=arm   && sha256sums=('7f3a409b4408603166350d496f9e5fec5d4e3f9ef15cd2d55e3350edb1280854');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
