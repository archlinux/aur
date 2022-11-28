# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-shell-extension-custom-accent-colors-git
pkgver=r23.3bcb70b
pkgrel=1
pkgdesc="Set a custom accent color for GTK4/GTK3 apps and GNOME Shell"
arch=('any')
url="https://github.com/demiskp/custom-accent-colors"
license=('GPL3')
depends=('adw-gtk3' 'gnome-shell')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/demiskp/custom-accent-colors.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/custom-accent-colors"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/custom-accent-colors"
}

package() {
  cd "$srcdir/custom-accent-colors"
  _uuid=custom-accent-colors@demiskp

  install -d "$pkgdir/usr/share/gnome-shell/extensions"
  cp -r "${_uuid}" "$pkgdir/usr/share/gnome-shell/extensions/"

  install -Dm644 "${_uuid}/schemas/org.gnome.shell.extensions.custom-accent-colors.gschema.xml" -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"
}
