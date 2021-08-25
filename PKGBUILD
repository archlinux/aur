# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=4.4.8
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('7a89e3693fa17fae4e8cefdeb4c65db49c377f78328d708d0bfd304b89719625');;
  aarch64)   _CARCH=arm64 && sha256sums=('475c7fff186a793329e1ac9f7977762ae248c9171a091b73a8731f551a27d789');;
  arm*)      _CARCH=arm   && sha256sums=('f7107ad62c8815949af0d6db19bba9bb343107a56d6a38c70bf6ae2ae2ca10dd');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
