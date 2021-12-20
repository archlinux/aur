# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-fuzzy-app-search-git
pkgver=4.1.0.r5.g76dee9f
pkgrel=2
pkgdesc="Fuzzy application search results for Gnome Search"
arch=('any')
url="https://gitlab.com/Czarlie/gnome-fuzzy-app-search"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.com/Czarlie/gnome-fuzzy-app-search.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make INSTALL_PATH="$pkgdir/usr/share/gnome-shell/extensions" install

  _uuid="${pkgname%-git}@gnome-shell-extensions.Czarlie.gitlab.com"

  install -Dm644 schemas/org.gnome.shell.extensions.gnome-fuzzy-search.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"

  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas/"
}
