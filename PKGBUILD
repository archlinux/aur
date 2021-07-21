# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-beta-bin"
pkgver=5.0.0_dev.1
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('bde9ddc6df5a9eef3a7e2b35b5c2441731f5d0dfe84eb3efc06b539a567634a2');;
  aarch64)   _CARCH=arm64 && sha256sums=('919cefdcac77104e38bcb3c2597fe8adf389907277b90b6da99339a6932b863b');;
  arm*)      _CARCH=arm   && sha256sums=('bca5dba7c1a8cf45a0429451b0950b46697fcb77eef3729020a801f74a7269c1');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v${pkgver/_/-}/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
