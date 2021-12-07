# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=5.2.1
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('70141637bbe7531d17cf313688520287572e78711361e7162237648a59a6e91d');;
  aarch64)   _CARCH=arm64 && sha256sums=('85a13d34afd59ff815da80e3b111833cd51ce0dab0a38042018cb85fd10bf7b7');;
  arm*)      _CARCH=arm   && sha256sums=('366d5383045d8de2404c29378733e283262673e89bfca16fa0b3349ae49249e2');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
