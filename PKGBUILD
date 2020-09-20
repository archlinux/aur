# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=3.0.2
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('4751acfdb6a90a2f39f97293c862835aa863744f4c8ac4654168527e0365f109');;
  aarch64)   _CARCH=arm64 && sha256sums=('714469cc62d4121015d4510677fe9b6b6208fa11f3f90ac07efc8da3d9db22fd');;
  arm*)      _CARCH=arm   && sha256sums=('6466cdbe74603a3d44056ba84c944175a16f0e1048d816f7272c1ad6028b6bda');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
