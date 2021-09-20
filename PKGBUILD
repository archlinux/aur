# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-beta-bin"
pkgver=5.0.0_rc.2
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('12007469058218083d2a8614a12f349b258048aff154c3db6c883cabe5449a1f');;
  aarch64)   _CARCH=arm64 && sha256sums=('8183021e7fb60800e3892d4047ae3ff6c556cd6bdc68980573be4f67d03cdd43');;
  arm*)      _CARCH=arm   && sha256sums=('e2d6797123dc6bde7207893abc0cd45b94833873a1711496bb20b51e6d6cbe18');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v${pkgver/_/-}/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
