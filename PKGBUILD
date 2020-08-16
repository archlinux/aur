# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=3.0.1
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('e773d3a8377b6562d2cf29e7683c89ecc03f5843990c1853b810ca1c656aeb2e');;
  aarch64)   _CARCH=arm64 && sha256sums=('a861bf5cab4376706c69836f81688eb24c2d7775a45de40cbb0612e7631e2037');;
  arm*)      _CARCH=arm   && sha256sums=('75a9ef3e0c67f9d5f950277932f68432424b3d44da1e3939270fdeda34b0ab7d');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
