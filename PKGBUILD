# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-beta-bin"
pkgver=4.4.8_rc.3
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('c0b5c3602a59e75e0fe04b3169a33982b164ac1072625edf20b75f955146905a');;
  aarch64)   _CARCH=arm64 && sha256sums=('06669886c56a87254c9d56f29d1b329d2eab3bccc0b4b8548900e763dbb543da');;
  arm*)      _CARCH=arm   && sha256sums=('0c683b63963e486530d56ea5717da87185a98b941fdcfe6cf77ab0eca6b16d7e');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v${pkgver/_/-}/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
