# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=5.8.2
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('7e92e883f2457aa8702f9f504a772fadec3ef3f9d678f929b2b8e05f3910a30c');;
  aarch64)   _CARCH=arm64 && sha256sums=('8134a7047afb3ed7aa32b7a967bc299dbe3abe640bab27fc9d2c9328b2361bbf');;
  arm*)      _CARCH=arm   && sha256sums=('62dc7eb8bcfe499d7163226668577c56ed8b85659ce3bcdecca686ee68c990ba');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
