# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-burn-my-windows
_pkgname=Burn-My-Windows
pkgver=18
pkgrel=1
pkgdesc="Disintegrate your apps the old-school way."
arch=('any')
url="https://github.com/Schneegans/Burn-My-Windows"
license=('GPL3')
depends=('gnome-shell')
makedepends=('zip')
source=(${url}/archive/v$pkgver.tar.gz)
b2sums=('b9d4dc09c5227338404067daf3b9df453f3da7da6a589c47e1a5fe4f65a0fee5bed346e0357924a5db22a26b4e3740a5847933b4ebc7ae2f1cc587fad63e8c86')

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
