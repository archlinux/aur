# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=5.4.2
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('2dc41edaa43a0149c4d510e5ce074303a09e0c66d106a3e7512887bd1a005a41');;
  aarch64)   _CARCH=arm64 && sha256sums=('2dd85b253dd598057f52efd5f6009a60c925c2f974314eb8d98a745bbff580e6');;
  arm*)      _CARCH=arm   && sha256sums=('a64fd91f302430d3495609716dd5b2d3c8c79c564eb2c8fdf4170a6b65d938cd');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
