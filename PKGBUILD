# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-desktop-cube
_pkgname=Desktop-Cube
pkgver=10
pkgrel=1
pkgdesc="Desktop Cube for GNOME Shell"
arch=('any')
url="https://github.com/Schneegans/Desktop-Cube"
license=('GPL3')
depends=('gnome-shell>=1:40')
makedepends=('zip')
source=(${url}/archive/v$pkgver.tar.gz)
b2sums=('1a37dc1cddb8feba74af4265da950c7d2ec1b4b7c7d71ff83130403f9880384d1fecd55eb7e0f89e38d1d9ee882eb2608dc0f920c4b6b462c27871ccc88891ba')

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
