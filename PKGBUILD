# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-beta-bin"
pkgver=5.0.0_alpha.0
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('d9383be8cc79b5d7210614a81dbe036bd30d70498d25e4f9ba0e80bea6d29121');;
  aarch64)   _CARCH=arm64 && sha256sums=('5ab69b245d9d6f5963ad2bf2ba774c2cef2969a555ab2d2cbd6450deda3a54a4');;
  arm*)      _CARCH=arm   && sha256sums=('a65e6c6e53139aded11b2500549486d3ce5e3832d73382c14cd7bf7bb11ad8cc');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v${pkgver/_/-}/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
