# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-smart-auto-move
_pkgname=smart-auto-move
pkgver=16
pkgrel=1
pkgdesc="Learns the size and position of your application windows and restores them to the correct place on subsequent launches"
arch=('any')
url="https://github.com/khimaros/smart-auto-move"
license=('GPL3')
depends=('gnome-shell')
makedepends=('zip')
source=($url/archive/v$pkgver.tar.gz)
b2sums=('acd499cf02bb92d8e52ce0262f8a10ec1eb798c9a9c7c51315c81398db1cde6ca3d8ee2e444357eff9e84129aa49a1a4fc8da2a1aa7acf6043910a7003244562')


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
