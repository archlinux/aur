# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-beta-bin"
pkgver=5.0.0_dev.0
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('38a6c7e794aefa938603158383cc0c2ce6b745e0d56c5f75e26de50ebfe96f03');;
  aarch64)   _CARCH=arm64 && sha256sums=('0dc85506230f0a9975ff184d741db160601624a62ba48d4d29fc7f77bc61f1a8');;
  arm*)      _CARCH=arm   && sha256sums=('eefa527eb46e71cd684fc766c9be4f8e4c01a4cf18d48cc3e0c4dccaa1d925c9');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v${pkgver/_/-}/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
