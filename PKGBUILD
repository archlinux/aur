# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-beta-bin"
pkgver=4.4.1_rc.0
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('f7e6c36107a8e953b6faa454fb65bc0e78f22d8448f290c17d552760ea6e8c09');;
  aarch64)   _CARCH=arm64 && sha256sums=('3327fb669c5da9c526a59f2549784e7e3734eb93518ee227ac183b056e1e1e01');;
  arm*)      _CARCH=arm   && sha256sums=('0e048168ddad1a999547f427a078659626fc188d81880e2962ed2ac4833e7194');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v${pkgver/_/-}/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
