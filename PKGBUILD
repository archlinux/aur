# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-beta-bin"
pkgver=5.0.0_rc.5
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('43afef1f1195c01aa8b5773ea1a5065a2b4383e5e8e2efab7d79844c8ad2253d');;
  aarch64)   _CARCH=arm64 && sha256sums=('7e883c9e6ef1443a7cba2b97667e1636745a0c0d9ab4c3512ac8d2b581da68f5');;
  arm*)      _CARCH=arm   && sha256sums=('46cfc12188181e440306d0017990d045672ab1b95a387ca9de9db5c183dc28b0');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v${pkgver/_/-}/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
