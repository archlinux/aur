# Maintainer: Alexandre DIDIER <archlinux.58b1s@passmail.net>
# Contributor: Nathaniel van Diepen <eeems@eeems.email>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-burn-my-windows
_pkgname=Burn-My-Windows
pkgver=48
pkgrel=1
pkgdesc="Disintegrate your windows with style. A GNOME Shell extension."
arch=('any')
url="https://github.com/Schneegans/Burn-My-Windows"
license=('GPL3')
depends=('gnome-shell')
makedepends=('glib2' 'zip')
source=(${url}/archive/v$pkgver.tar.gz)
sha256sums=('e25a91dcfd35a06a6f1acadce63ea5d92c975e9855e6d023b8f04d525d681e2d')

build() {
  cd "$_pkgname-$pkgver"

  make zip
}

package() {
  cd "$_pkgname-$pkgver"

  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
  bsdtar -xvf ${uuid}.zip -C "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
  glib-compile-schemas "$pkgdir/usr/share/gnome-shell/extensions/${uuid}/schemas"
}
