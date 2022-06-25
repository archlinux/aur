# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-shell-configurator
_pkgname=shell-configurator
pkgver=4
pkgrel=1
pkgdesc="Configure and customize GNOME Shell with advanced settings."
arch=('any')
url="https://gitlab.com/adeswantaTechs/shell-configurator"
license=('GPL3')
depends=('gnome-shell-extensions')
makedepends=('zip')
source=($url/-/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz)
b2sums=('7fef1a7e626b2a95c1bcdce1ee541e96df041a0b91b35af396934b024b3a21aafba3a121f1790a7dac16f66eccd94796cde3afe32bdc2e239101d2f1686b3003')

build() {
  cd "$_pkgname-v$pkgver"

  ./installer.sh --build
}

package() {
  cd "$_pkgname-v$pkgver"

  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' shell-configurator@adeswanta/metadata.json)
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
  bsdtar -xvf ${uuid}.shell-extension.zip -C "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
}
