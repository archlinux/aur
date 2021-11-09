# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=5.1.0
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('e04cfb3cc04de17c9d4272d0b5506ee5ca1070e36e07519fbe6c00153b993195');;
  aarch64)   _CARCH=arm64 && sha256sums=('b997473b1ae640e2c6850fb539875a8d192dddbf7af708a22691bcc83d42191c');;
  arm*)      _CARCH=arm   && sha256sums=('60c54419a17c9c0d1ad9e4c4d8b8c2658e5e4490452075c940038e902ce12cc9');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
