# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-smart-auto-move
_pkgname=smart-auto-move
pkgver=15
pkgrel=1
pkgdesc="Learns the size and position of your application windows and restores them to the correct place on subsequent launches"
arch=('any')
url="https://github.com/khimaros/smart-auto-move"
license=('GPL3')
depends=('gnome-shell')
makedepends=('zip')
source=($url/archive/v$pkgver.tar.gz)
b2sums=('463b2e36a48e97d52c60412fe368a7ee6b3a01cd167b78b33073af0d7ef97982900adf068742233fecc514cdea10c4d89890b0fcfed3d3f4f29f08d29bad250d')


build() {
  cd "$_pkgname-$pkgver"

  make
}

package() {
  cd "$_pkgname-$pkgver"

  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' smart-auto-move@khimaros.com/metadata.json)
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
  bsdtar -xvf ${uuid}.shell-extension.zip -C "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
}
