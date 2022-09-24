# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-panel-corners
_pkgname=panel-corners
pkgver=5
pkgrel=1
pkgdesc="A gnome-shell extension to keep the old topbar corners, which were removed for GNOME 42"
arch=('any')
url="https://github.com/aunetx/panel-corners"
license=('GPL3')
depends=('gnome-shell')
makedepends=('zip')
source=(${url}/archive/v$pkgver.tar.gz)
b2sums=('34a5f36db64cb82916b525ea312bc4242d189c726ce4f0aea5500a08be267ca503d6029ff008c5a70e086bb1b2fb723c38d404f2b003062e8a1a4a38fa9a6d56')

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
