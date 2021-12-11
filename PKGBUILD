# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-desktop-cube
_pkgname=Desktop-Cube
pkgver=4
pkgrel=1
pkgdesc="Desktop Cube for GNOME Shell"
arch=('any')
url="https://github.com/Schneegans/Desktop-Cube"
license=('GPL3')
depends=('gnome-shell>=1:40')
makedepends=('zip')
source=(${url}/archive/v$pkgver.tar.gz)
sha512sums=('cfee930d8d104cbe8f66754d93044db85e45eb197cdbb03a5c4b9d72c1fd19dfab52c0ea5d1a0b6dc8533940321eba420333f812553a6952e4365c0064758fcd')

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
