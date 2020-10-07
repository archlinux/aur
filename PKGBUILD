# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>
_pkgname=drop-down-terminal
pkgname=gnome-shell-extension-$_pkgname
pkgver=24.patch2
_pkgver=24
pkgrel=1
pkgdesc="Drop Down Terminal extension for the Gnome Shell"
arch=('any')
url="https://github.com/zzrough/gs-extensions-$_pkgname"
license=('GPL3')
depends=('gnome-shell')
install=$_pkgname.install
source=($_pkgname-$pkgver.tar.gz::https://github.com/zzrough/gs-extensions-$_pkgname/archive/v$_pkgver.tar.gz
        https://patch-diff.githubusercontent.com/raw/zzrough/gs-extensions-drop-down-terminal/pull/245.diff)
sha256sums=('abeaab555b48820f4f72224f3c60bbecd7c7cd696c42cd44fbaa7c5e763a990d'
            '9086cb782959a315b33262e0ec77af32f2fe21733af612f1930cb8806bab14b7')

prepare() {
  cd "gs-extensions-$_pkgname-$_pkgver"
  patch --forward --strip=1 --input="$srcdir"/245.diff
}

package() {
  _uuid='drop-down-terminal@gs-extensions.zzrough.org'

  install -d "$pkgdir"/usr/share/gnome-shell/extensions
  install -d "$pkgdir"/usr/share/glib-2.0/schemas

  cd "$srcdir"/gs-extensions-drop-down-terminal-$_pkgver
  mv $_uuid/org.zzrough.gs-extensions.drop-down-terminal.gschema.xml \
    "$pkgdir"/usr/share/glib-2.0/schemas/
  cp -af $_uuid "$pkgdir"/usr/share/gnome-shell/extensions/
}
