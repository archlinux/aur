# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=3.1.5
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('95c2014561599f3a94f44d05de1c25cf9e5ba6bb892faf43a02422e50e8e7e94');;
  aarch64)   _CARCH=arm64 && sha256sums=('bd7016183970c3fd257068b6f028a2ed9b3b8e89ef78bb870434de30ecbdfa2d');;
  arm*)      _CARCH=arm   && sha256sums=('2e10fa254bb9a369e6caa3cad1c127a4f36463f5b41f5be756c811afcc624b08');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
