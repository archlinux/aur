# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-shell-extension-dynamic-panel-transparency-git
_gitname=dynamic-panel-transparency
pkgver=35.r340.63c8b81
pkgrel=2
pkgdesc="Adds Transparency To The Gnome Shell Panel"
arch=('any')
url="https://ewlsh.github.io/dynamic-panel-transparency"
license=('GPL')
depends=('gnome-shell')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/ewlsh/dynamic-panel-transparency.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "35.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_gitname"
  _uuid="${_gitname}@rockon999.github.io"
  _schema="org.gnome.shell.extensions.$_gitname.gschema.xml"

  install -d "$pkgdir/usr/share/gnome-shell/extensions/"
  cp -r $_uuid/ "$pkgdir/usr/share/gnome-shell/extensions/"

  install -Dm644 "$_uuid/schemas/org.gnome.shell.extensions.$_gitname.gschema.xml" -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"

  rm "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/$_gitname.pot"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas/"
}
