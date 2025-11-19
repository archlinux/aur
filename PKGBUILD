# Maintainer: Alexandre DIDIER <archlinux.58b1s@passmail.net>
# Contributor: Nathaniel van Diepen <eeems@eeems.email>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-burn-my-windows
_pkgname=Burn-My-Windows
pkgver=47
pkgrel=2
pkgdesc="Disintegrate your windows with style. A GNOME Shell extension."
arch=('any')
url="https://github.com/Schneegans/Burn-My-Windows"
license=('GPL3')
depends=('gnome-shell')
makedepends=('glib2' 'zip')
source=(${url}/archive/v$pkgver.tar.gz)
sha256sums=('b0bcfaddef021470d0266f98344a8c924705fca82da7c0d9ae6fa4ace7f8f3b3')

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
