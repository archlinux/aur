# Maintainer: Michael Schubert <mschu. dev at gmail>
# Contributor: Maxim Andersson <thesilentboatman@gmail.com>
_pkgname=drop-down-terminal
_gitname=gs-extensions-$_pkgname
pkgname=gnome-shell-extension-$_pkgname-git
pkgver=24.r2.ga59669a
pkgrel=2
pkgdesc="Drop Down Terminal extension for the Gnome Shell"
arch=('any')
url="https://github.com/zzrough/$_gitname"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
install=$_pkgname.install
source=(git+https://github.com/zzrough/$_gitname
        https://patch-diff.githubusercontent.com/raw/zzrough/gs-extensions-drop-down-terminal/pull/245.diff)
sha256sums=('SKIP'
            '9086cb782959a315b33262e0ec77af32f2fe21733af612f1930cb8806bab14b7')

pkgver() {
  cd "$srcdir"/$_gitname
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir"/$_gitname
  patch --forward --strip=1 --input="$srcdir"/245.diff
}

package() {
  _uuid='drop-down-terminal@gs-extensions.zzrough.org'

  install -d "$pkgdir"/usr/share/gnome-shell/extensions
  install -d "$pkgdir"/usr/share/glib-2.0/schemas

  cd "$srcdir"/$_gitname
  mv $_uuid/org.zzrough.gs-extensions.drop-down-terminal.gschema.xml \
    "$pkgdir"/usr/share/glib-2.0/schemas/
  cp -af $_uuid "$pkgdir"/usr/share/gnome-shell/extensions/
}
