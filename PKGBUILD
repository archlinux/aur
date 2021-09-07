# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-beta-bin"
pkgver=5.0.0_beta.1
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('9a0e370e0f975068f64a38a124b9f507db34359a268f2e8fd07ccb090e719751');;
  aarch64)   _CARCH=arm64 && sha256sums=('7aaf5a3bcc86542d73fdc3029aa99095858c7501bf3fc9e955588a98b0cf8419');;
  arm*)      _CARCH=arm   && sha256sums=('8b6448f4b45b178a5764492afe257ab8447bb9d16380836c859aa70b66b0a8e9');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v${pkgver/_/-}/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
