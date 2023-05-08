# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-desktop-cube
_pkgname=Desktop-Cube
pkgver=15
pkgrel=1
pkgdesc="Desktop Cube for GNOME Shell"
arch=('any')
url="https://github.com/Schneegans/Desktop-Cube"
license=('GPL3')
depends=('gnome-shell')
makedepends=('zip')
source=(${url}/archive/v$pkgver.tar.gz)
b2sums=('72236d10c342c90430590437970e5f395091cbb1fff5665c99ad6cd69b044d307e328245897cdd5328f11b7ba7dc974078cc86a9b0c44a13a1f25d3ef9016dfd')

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
