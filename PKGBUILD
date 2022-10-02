# Maintainer: Francois Menning <f.menning@pm.me>
# Contributer: Mark Wagie <mark dot wagie at tutanota dot com>

_pkgname=gnome-fuzzy-app-search
pkgname=gnome-shell-extension-fuzzy-app-search
pkgver=5.0.14
pkgrel=1
pkgdesc="Fuzzy application search results for Gnome Search"
arch=('any')
url="https://gitlab.com/Czarlie/gnome-fuzzy-app-search"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
provides=("${pkgname%-git}" "${_pkgname}")
conflicts=("${pkgname%-git}" "${_pkgname}")
source=('git+https://gitlab.com/Czarlie/gnome-fuzzy-app-search.git#tag=v5.0.14')
sha256sums=('SKIP')

build() {
  cd "$srcdir/${_pkgname%-git}"
  make build
}

package() {
  cd "$srcdir/${_pkgname%-git}"
  make INSTALL_PATH="$pkgdir/usr/share/gnome-shell/extensions" install

  _uuid="${_pkgname%-git}@gnome-shell-extensions.Czarlie.gitlab.com"

  install -Dm644 schemas/org.gnome.shell.extensions.gnome-fuzzy-search.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"

  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas/"
}
