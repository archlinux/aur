# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-desktop-cube
_pkgname=Desktop-Cube
pkgver=8
pkgrel=1
pkgdesc="Desktop Cube for GNOME Shell"
arch=('any')
url="https://github.com/Schneegans/Desktop-Cube"
license=('GPL3')
depends=('gnome-shell>=1:40')
makedepends=('zip')
source=(${url}/archive/v$pkgver.tar.gz)
b2sums=('9fbeaac054d66f4811327d1c80f4e5c8113640f46bd414879818fc23b14559051c226fe86844b9f1f76df3ee3aa42edc8e580b9818a0343e73d0605f4365009e')

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
