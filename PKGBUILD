# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-beta-bin"
pkgver=5.0.4_rc.0
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('e4e398dcc4b7479abaa5cf0542b6780d56992570657602cd8aeb86322c9c4a6d');;
  aarch64)   _CARCH=arm64 && sha256sums=('e94fb8191eef259883618dc9fedbea14edc3eba81c9849836d3d9737107136fc');;
  arm*)      _CARCH=arm   && sha256sums=('ce63b8f9c57d7ad4ad918fcf7fb7c384a724c4a92fd5f2f04df1753fdba7f653');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v${pkgver/_/-}/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
