# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-big-avatar
_pkgname=Big-Avatar-Gnome-Shell-Extension
pkgver=16
pkgrel=1
pkgdesc="An extension based on https://github.com/db0x/bigavatar-db0x.de, it adds your avatar icon and name to the menu panel. It allows you to tweak the size of both font and avatar image"
arch=('any')
url="https://github.com/GustavoPeredo/Big-Avatar-Gnome-Shell-Extension"
license=('GPL3')
depends=('gnome-shell')
source=(${url}/archive/v$pkgver.tar.gz)
b2sums=('a7df1e8fc73d88441593df69bfba100a6f6e0527a28408efb313e6363244ca8a90e05bde8deccc5d62a6f7c0ecf5f0757cf23a53c51ad8515e8992a88af90549')

build() {
  cd "$_pkgname-$pkgver"
  glib-compile-schemas schemas
  gnome-extensions pack \
            --force \
            --extra-source="assets" \
            --extra-source="schema" \
            --extra-source="LICENSE" \
            --extra-source="README.md"
}

package() {
	cd "$_pkgname-$pkgver"
  
  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
  bsdtar -xvf ${uuid}.shell-extension.zip -C "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
}
