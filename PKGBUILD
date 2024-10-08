# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=5.7.4
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('1ac1da365236736a8df8c32107b54aca208384ab1d9a06771443c85ad698a5eb');;
  aarch64)   _CARCH=arm64 && sha256sums=('bc580e0ca907156acd495d42975ed1687ab3a9ac0392af3919afc62a8a8b6670');;
  arm*)      _CARCH=arm   && sha256sums=('90df4693284772a19bff8677520c124367a3fbe81463e7f156b9b692479428f1');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
