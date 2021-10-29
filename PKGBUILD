# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=5.0.3
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('018421fdff567df5df3840e75501a40199501ce6bf25e1f2dd259f74e13519f3');;
  aarch64)   _CARCH=arm64 && sha256sums=('ebf696c1b3047ecfc041087abceddcf2f120769269defc919779cec2e6ca786b');;
  arm*)      _CARCH=arm   && sha256sums=('8b7efc0d1727b0ed493b7a860afa5bc5f35b8d3aec68fc41cf7590e10cb9fb7e');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
