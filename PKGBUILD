# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=5.0.2
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('128b25bb040714b2e7437e009c2d636f93c521a43a54dbb45c43a7a8729ab3e9');;
  aarch64)   _CARCH=arm64 && sha256sums=('0b00d41910b8c6e24aea178b643eb3ff8548dd846f2d7b880a89dd8855432678');;
  arm*)      _CARCH=arm   && sha256sums=('f5bdd989158ee6d1b5289ebdf25e38bce6987ec8e6ac47ba814894e6cd517b6e');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
