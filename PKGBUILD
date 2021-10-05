# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=5.0.0
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('6744bfd5cea611dc3f2a24da7b25a28fd0dd4b78c486193c238d55619d7b7c43');;
  aarch64)   _CARCH=arm64 && sha256sums=('c4d34ac455750e46dcdfd98b5d63002481a1edb7eef5585241c8ec8137d96735');;
  arm*)      _CARCH=arm   && sha256sums=('165ecf9ee29b9768f07f3349662898b6eefa40e7fee325b931c2f9179d202a86');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
