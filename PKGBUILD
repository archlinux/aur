# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=5.2.0
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('223bcbf2a6c407e72910727d47dcaae5d4ed1c90d356d9bee968b385d645e806');;
  aarch64)   _CARCH=arm64 && sha256sums=('a3f7231734e1657e1248a40fd7851504390343bb15a8d503b681d734b298f1da');;
  arm*)      _CARCH=arm   && sha256sums=('ecca7b0d6f1d47a2e93da854367f2b993b8cd8642f90eb535057853f580451b6');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
