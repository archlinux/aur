# Maintainer: Achilleas Koutsou <achilleas@koutsou.net>

pkgname=osbuild-composer
pkgdesc='An HTTP service for building bootable OS images.'
pkgver=46
pkgrel=1
url="https://www.osbuild.org"
arch=(x86_64)
license=(Apache)
depends=('dnf')
makedepends=('go')
optdepends=()
source=($pkgname-$pkgver.tar.gz::https://github.com/osbuild/osbuild-composer/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('33043ab3ea3c6e93176b61430d5c5ea5ff77f4cf3ecc150acf08bbe4fd05c7b0')

build() {
  cd $pkgname-$pkgver

  sed -i 's,/usr/libexec,/usr/lib,g' distribution/osbuild-dnf-json.service
}

package() {
  cd $pkgname-$pkgver

  install -Dm 755 "dnf-json" "${pkgdir}/usr/lib/osbuild-composer/dnf-json"
  install -Dm 644 "distribution/osbuild-dnf-json.service" "${pkgdir}/usr/lib/systemd/system/osbuild-dnf-json.service"
  install -Dm 644 "distribution/osbuild-dnf-json.socket" "${pkgdir}/usr/lib/systemd/system/osbuild-dnf-json.socket"
}
