# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-shell-extension-windowoverlay-icons-git
pkgver=37.r0.gbf02525
pkgrel=1
pkgdesc="Adds application icons to the windows overview (in Activities menu)"
arch=('any')
url="https://github.com/sustmi/gnome-shell-extension-windowoverlay-icons"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git' 'zip')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/sustmi/gnome-shell-extension-windowoverlay-icons.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make schemas
  make locales
  make zip
}

package() {
  cd "$srcdir/${pkgname%-git}"
  _uuid='windowoverlay-icons@sustmidown.centrum.cz'

  install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  bsdtar xvf windowoverlay-icons.zip -C \
    "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"

  install -d "$pkgdir/usr/share/glib-2.0/schemas"
  ln -s "/usr/share/gnome-shell/extensions/$_uuid/schemas/org.gnome.shell.extensions.windowoverlay-icons.gschema.xml" \
    "$pkgdir/usr/share/glib-2.0/schemas"
}
