# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-desktop-cube
_pkgname=Desktop-Cube
pkgver=5
pkgrel=1
pkgdesc="Desktop Cube for GNOME Shell"
arch=('any')
url="https://github.com/Schneegans/Desktop-Cube"
license=('GPL3')
depends=('gnome-shell>=1:40')
makedepends=('zip')
source=(${url}/archive/v$pkgver.tar.gz)
sha512sums=('d670e6f89c9b5df28c7b0af2f5c90b376da9caaa4f779e2c5500b5c31d2677d9e894f52ac4cc2763eb8a5ac33c9c329bc3623e90a99ce3238425d1fdd066a15a')

build() {
  cd "$_pkgname-$pkgver"

  make zip
}

package() {
  cd "$_pkgname-$pkgver"

  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
  bsdtar -xvf ${uuid}.zip -C "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
}
