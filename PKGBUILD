# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-shell-configurator
_pkgname=shell-configurator
pkgver=5
pkgrel=2
pkgdesc="Configure and customize GNOME Shell with advanced settings."
arch=('any')
url="https://gitlab.com/adeswantaTechs/shell-configurator"
license=('GPL3')
depends=('gnome-shell-extensions')
makedepends=('zip')
source=($url/-/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz)
b2sums=('e2cb2df1fee6765aca82e1bd07d4d359b76fb76f36c2a48b559686038d566b961bebad1bdc01311ab116300e1b9c5f733d6799aa7d92b8e5329bed106196ca0e')

prepare() {
  cd "$_pkgname-v$pkgver"
  sed -i '23d' installer.sh
}

build() {
  cd "$_pkgname-v$pkgver"

  ./installer.sh --build
}

package() {
  cd "$_pkgname-v$pkgver"

  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' src/metadata.json)
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
  bsdtar -xvf ${uuid}.shell-extension.zip -C "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
}
