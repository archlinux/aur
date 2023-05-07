# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-burn-my-windows
_pkgname=Burn-My-Windows
pkgver=31
pkgrel=1
pkgdesc="Disintegrate your apps the old-school way."
arch=('any')
url="https://github.com/Schneegans/Burn-My-Windows"
license=('GPL3')
depends=('gnome-shell')
makedepends=('zip')
source=(${url}/archive/v$pkgver.tar.gz)
b2sums=('1a941ef0dce5d7ccb142c8907cf138addce1dfb47aac4b1fc2be1ee87f10df318daf45018e95d2f7df4be14c28b17e50c90471cb7462dc6af6dbbb4627dfab91')

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
