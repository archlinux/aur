# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-burn-my-windows
_pkgname=Burn-My-Windows
pkgver=2
pkgrel=1
pkgdesc="Disintegrate your apps the old-school way."
arch=('any')
url="https://github.com/Schneegans/Burn-My-Windows"
license=('GPL3')
depends=('gnome-shell>=1:40')
makedepends=('zip')
source=(${url}/archive/v$pkgver.tar.gz)
b2sums=('7432b84c7652f16f04d75d5b635ee0bff531ccc066efc4614909afc8d21c6ada466f0020867d80f3fc80b3e434758346cf5d8f5dc247b5d2591805d7c320c68f')

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
