# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-fly-pie
_pkgname=Fly-Pie
pkgver=24
pkgrel=2
pkgdesc="Fly-Pie is an innovative marking menu written as a GNOME Shell extension"
arch=('any')
url="https://github.com/Schneegans/Fly-Pie"
license=('MIT')
depends=('gnome-shell')
makedepends=('zip')
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('3545149fdd271fe2d4bc0b80990b6a1cdedce68fabc5e810253ba24eae391f3c943ee994983274e210a8dbf4cd54682a6b4a4a8f661c8b2230eab4da6ff82595')

build() {
  cd "$_pkgname-$pkgver"

  make zip
}

package() {
  cd "$_pkgname-$pkgver"
  _uuid='flypie@schneegans.github.com'
  
  install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  bsdtar -xvf $_uuid.zip -C "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  glib-compile-schemas "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas"
}
