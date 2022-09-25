# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-shell-extension-fuzzy-app-search-git
pkgver=5.0.14.r0.gbc78114
pkgrel=2
pkgdesc="Fuzzy application search results for Gnome Search"
arch=('any')
url="https://gitlab.com/Czarlie/gnome-fuzzy-app-search"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'gnome-fuzzy-app-search')
replaces=('gnome-fuzzy-app-search-git')
source=('git+https://gitlab.com/Czarlie/gnome-fuzzy-app-search.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/gnome-fuzzy-app-search"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/gnome-fuzzy-app-search"
  make build
}

package() {
  cd "$srcdir/gnome-fuzzy-app-search"
  _uuid="gnome-fuzzy-app-search@gnome-shell-extensions.Czarlie.gitlab.com"

  make INSTALL_PATH="$pkgdir/usr/share/gnome-shell/extensions" install

  install -Dm644 schemas/org.gnome.shell.extensions.gnome-fuzzy-search.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"

  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas/"
}
