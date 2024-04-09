# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="rancher-k3d-bin"
pkgver=5.6.2
pkgrel=1
pkgdesc='Little helper to run Rancher Labs k3s in Docker'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/rancher/k3d'
license=('MIT')
provides=("k3d")
conflicts=("rancher-k3d-beta-bin")

case "${CARCH}" in
  x86_64)    _CARCH=amd64 && sha256sums=('99b31f7a0244c381e85d18400d62a8e9358ebebe6c65319dbfb94690f2f654db');;
  aarch64)   _CARCH=arm64 && sha256sums=('93fb1f6000f20296f5e6ae8aa8a05b06f1f13adb59ff419ee5bb25db4cbef01f');;
  arm*)      _CARCH=arm   && sha256sums=('92568c05057c63c906203362e1392ee201010bccb7ad6458f5361451d0adf537');;
esac

source=("${pkgname}-${pkgver}-${_CARCH}::https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${_CARCH}")

package() {
  install -Dm 0755 ${pkgname}-${pkgver}-${_CARCH} "$pkgdir/usr/bin/k3d"
}
