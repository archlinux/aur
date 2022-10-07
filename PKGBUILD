# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-panel-corners
_pkgname=panel-corners
pkgver=6
pkgrel=1
pkgdesc="A gnome-shell extension to keep the old topbar corners, which were removed for GNOME 42"
arch=('any')
url="https://github.com/aunetx/panel-corners"
license=('GPL3')
depends=('gnome-shell')
makedepends=('zip')
source=(${url}/archive/v$pkgver.tar.gz)
b2sums=('28d9a6195258ddef3b40c029b91c479771826e516b3fe7279cb99612f0fe9c01cc941306ee11a80bc6dd5f47d45324d4208cc761a8507b68528895318f906c00')

build() {
  cd "$_pkgname-$pkgver"

  make pkg
}

package() {
  cd "$_pkgname-$pkgver"

  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
  bsdtar -xvf pkg/${uuid}.zip -C "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
}
